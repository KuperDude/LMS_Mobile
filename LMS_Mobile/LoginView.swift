//
//  LoginView.swift
//  FoodTaskerMobile
//
//  Created by MyBook on 04.12.2022.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var mainVM: MainViewModel
    
    @ObservedObject var vm: LoginViewModel
    
    @State var isRegistration = false
    @State var isShowAlert = false
    
    @State var pressedForgotPassword = false
    @State var pressedRegistration = false
    
    init(mainVM: MainViewModel) {
        self._mainVM = ObservedObject(initialValue: mainVM)
        self.vm = LoginViewModel(user: mainVM.user)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                nameApp
                
                createdBy
                
                VStack(spacing: 20) {
                    if !isRegistration {
                        Spacer()
                    }
                    LoginPickerView(isRegistration: $isRegistration)
                    
                    textFieldsSegment
                    
                    loginButton
                    
                    if !isRegistration {
                        forgotPasswordButton
                    }
                    
                    loginAsAnonymousButton
                }
            }
            .padding(.horizontal, 20)
            .background {
                backgroundImage
            }
            
            
            ForgotPasswordView(isOpen: $pressedForgotPassword)
            SendCodeOnMailView(isOpen: $pressedRegistration, code: $vm.code) {
                vm.sendCode()
            } completion: {
                vm.register()
                pressedRegistration = false
            }
            
        }
        .onChange(of: vm.user, perform: { user in
            mainVM.user = user
        })
        .fullScreenCover(item: $vm.user, content: { user in
            //HomeView(mainVM: mainVM)
        })
        .onChange(of: vm.alertStatus, perform: { status in
            guard let _ = status else { return }
            isShowAlert = true
        })
        .alert(vm.errorText(vm.alertStatus) ?? "", isPresented: $isShowAlert) {
            Button("OK", role: .cancel) {
                vm.alertStatus = nil
            }
        }
        .onReceive(vm.$code, perform: { code in
            guard let _ = code else { return }
            UIApplication.shared.endEditing()
            pressedRegistration = true
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(mainVM: MainViewModel())
    }
}

extension LoginView {
    var nameApp: some View {
        Text("StreetFood")
            .font(.custom("Avenir Next", size: 49))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
    
    var createdBy: some View {
        Text("Автор: Григорий Поляков")
            .foregroundColor(Color.init(uiColor: .lightGray))
    }
    
    
    var textFieldsSegment: some View {
        VStack(spacing: 0) {
            if isRegistration {
                TextField("Имя", text: $vm.username)
                    .textFieldStyle(text: $vm.username)
            }
               
            TextField("Почта", text: $vm.mail)
                .textFieldStyle(text: $vm.mail)
            
            SecureField("Пароль", text: $vm.password1)
                .textFieldStyle(text: $vm.password1)
            
            if isRegistration {
                SecureField("Повтор пароля", text: $vm.password2)
                    .textFieldStyle(text: $vm.password2)
            }
        }
    }
    
    var loginButton: some View {
        Button {
            if isRegistration {
                if vm.checkCurrectData() {
                    vm.sendCode()
                }
            } else {
                
            }
        } label: {
            Text(isRegistration ? "Продолжить" : "Войти")
                .minimumScaleFactor(0.5)
                .font(.system(size: 17))
                .foregroundColor(.theme.accent)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.green)
                }
        }
    }
    
    var backgroundImage: some View {
        Image("background_img")
            .resizable()
            .ignoresSafeArea(.all)
            .scaledToFill()
    }
    
    var forgotPasswordButton: some View {
        Text("Забыли свой пароль?")
            .foregroundColor(Color.init(uiColor: .lightGray))
            .underline()
            .onTapGesture {
                //UIApplication.shared.endEditing()
                pressedForgotPassword = true
            }
    }
    
    var loginAsAnonymousButton: some View {
        Text("Войти без регистрации")
            .foregroundColor(Color.init(uiColor: .lightGray))
            .underline()
            .onTapGesture {
                //UIApplication.shared.endEditing()
                vm.authService.user = User(id: "Anonymous", firstName: "Anonymous", lastName: "", imageURL: "")
            }
            .padding(.bottom, 50)
    }
}
