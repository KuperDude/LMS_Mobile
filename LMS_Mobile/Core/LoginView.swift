//
//  LoginView.swift
//  FoodTaskerMobile
//
//  Created by MyBook on 04.12.2022.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct LoginView: View {
    
    @Environment(\.router) var router
    
    @ObservedObject var mainVM: MainViewModel
    @ObservedObject var vm: LoginViewModel
    
    @State var isRegistration = false
    @State private var isRegistrationProcessing = false
    @State var isShowAlert = false
    
    @State var pressedForgotPassword = false
    @State var pressedRegistrationCode: Int? = nil
    
    init(mainVM: MainViewModel) {
        self._mainVM = ObservedObject(initialValue: mainVM)
        self.vm = LoginViewModel(user: mainVM.user)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                nameApp
                                
                VStack(spacing: 20) {
                    if !isRegistration {
                        Spacer()
                    }
                    PickerView(values: ["Вход", "Регистрация"]) { value in
                        isRegistration = value == "Регистрация"
                    }
                    
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
                
            SendCodeOnMailView(code: $pressedRegistrationCode, mail: vm.mail) {
                Task {
                    isRegistrationProcessing = true
                    await vm.register()
                    pressedRegistrationCode = nil
                    isRegistrationProcessing = false
                    
                    guard let user = vm.user else { return }
                    router.showScreen(.fullScreenCover) { _ in
                        Text("New Screen")
                    }
                }
            }
            .overlay(alignment: .bottom) {
                if isRegistrationProcessing {
                    ProgressView()
                }
            }
            
        }
        .onChange(of: vm.alertStatus) { _, status in
            guard let _ = status else { return }
            isShowAlert = true
        }
        .alert(vm.errorText(vm.alertStatus) ?? "", isPresented: $isShowAlert) {
            Button("OK", role: .cancel) {
                vm.alertStatus = nil
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView { _ in
            LoginView(mainVM: MainViewModel())
        }
    }
}

extension LoginView {
    var nameApp: some View {
        Text("ЦТПО Курсы")
            .font(.custom("Avenir Next", size: 49))
            .fontWeight(.bold)
            .foregroundColor(.white)
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
        
        AsyncButton {
            pressedRegistrationCode = try? await AuthManager.instance.sendCodeOn(mail: vm.mail)
        } label: { isPerformingAction in
            ZStack {
                 if isPerformingAction {
                       ProgressView()
                 }
                   
                Text(isRegistration ? "Продолжить" : "Войти")
                    .opacity(isPerformingAction ? 0 : 1)
            }
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
                Task {
                    await vm.authService.createAnonymous()
                }
            }
            .padding(.bottom, 50)
    }
}
