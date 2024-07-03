//
//  CourseDetailView.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import SwiftUI
import SwiftfulRouting

struct CourseDetailView: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    
    @State private var webViewHeight: CGFloat = .zero
    @State private var showHeader: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            ScrollView {
                CourseDetailHeaderView(title: product.title, subtitle: product.brand ?? "", imageName: product.firstImage)
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                
                HTMLStringView(htmlContent: """
                               
                               <!DOCTYPE html>
                               <html lang="ru">
                               <head>
                                   <meta charset="UTF-8">
                                   <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                   <title>Описание курса по Django</title>
                                   <style>
                                       body {
                                           font-family: Arial, sans-serif;
                                           line-height: 1.6;
                                           margin: 0;
                                           padding: 0;
                                           background-color: \(UIColor(Color.theme.background).toHexString());
                                           color: \(UIColor(Color.theme.accent).toHexString());
                                       }
                                       .container {
                                           max-width: 800px;
                                           margin: 0 auto;
                                           padding: 20px;
                                           background-color: \(UIColor(Color.theme.background).toHexString());
                                       }
                                       h1, h2, h3 {
                                           color: \(UIColor(Color.theme.accent).toHexString());
                                       }
                                       ul {
                                           margin-left: 20px;
                                       }
                                   </style>
                               </head>
                               <body>
                                   <div class="container">
                                       
                                       <h2>Введение в Django</h2>
                                       <p>Django — это мощный веб-фреймворк на языке Python, который позволяет быстро создавать безопасные и масштабируемые веб-приложения. Django придерживается принципа "Батарейки включены", что означает наличие всех необходимых инструментов и библиотек из коробки. Этот курс предназначен для разработчиков, желающих освоить Django и создать полнофункциональные веб-приложения от начала до конца.</p>
                                       
                                       <h2>Цели курса</h2>
                                       <ul>
                                           <li>Освоение основ Django и его архитектуры.</li>
                                           <li>Понимание структуры проектов Django и управление ими.</li>
                                           <li>Создание моделей данных и работа с базами данных через Django ORM.</li>
                                           <li>Разработка пользовательских интерфейсов с использованием Django Templates.</li>
                                           <li>Реализация функциональности через Django Views и маршрутизацию URL.</li>
                                           <li>Настройка админ-панели Django и управление данными.</li>
                                           <li>Работа с формами и валидацией данных.</li>
                                           <li>Аутентификация и авторизация пользователей.</li>
                                           <li>Интеграция с внешними API и сервисами.</li>
                                           <li>Тестирование и отладка Django-приложений.</li>
                                           <li>Развертывание приложений на продакшн-сервере.</li>
                                       </ul>
                                       
                                       <h2>Программа курса</h2>
                                       
                                       <h3>Модуль 1: Введение в Django</h3>
                                       <ul>
                                           <li>Знакомство с Django: история, основные концепции и преимущества.</li>
                                           <li>Установка и настройка рабочего окружения.</li>
                                           <li>Создание первого проекта Django и его структура.</li>
                                       </ul>
                                       
                                       <h3>Модуль 2: Модели и базы данных</h3>
                                       <ul>
                                           <li>Основы Django ORM.</li>
                                           <li>Определение моделей и миграции.</li>
                                           <li>Работа с различными типами полей.</li>
                                           <li>Связи между моделями: One-to-One, One-to-Many, Many-to-Many.</li>
                                           <li>Основные операции с базой данных: создание, чтение, обновление, удаление (CRUD).</li>
                                       </ul>
                                       
                                       <h3>Модуль 3: Виды и шаблоны</h3>
                                       <ul>
                                           <li>Введение в Django Views: функции и классы представлений.</li>
                                           <li>URL маршрутизация и конфигурация.</li>
                                           <li>Работа с шаблонами Django: создание и использование.</li>
                                           <li>Расширенные возможности шаблонов: наследование, фильтры и теги.</li>
                                       </ul>
                                       
                                       <h3>Модуль 4: Формы и валидация данных</h3>
                                       <ul>
                                           <li>Создание и использование форм в Django.</li>
                                           <li>Валидация данных и отображение ошибок.</li>
                                           <li>Формы моделей и формсеты.</li>
                                       </ul>
                                       
                                       <h3>Модуль 5: Аутентификация и авторизация</h3>
                                       <ul>
                                           <li>Встроенная система аутентификации Django.</li>
                                           <li>Создание пользовательской модели пользователя.</li>
                                           <li>Управление пользователями и группами.</li>
                                           <li>Реализация авторизации и ограничение доступа к ресурсам.</li>
                                       </ul>
                                       
                                       <h3>Модуль 6: Админ-панель Django</h3>
                                       <ul>
                                           <li>Настройка и кастомизация административного интерфейса.</li>
                                           <li>Управление моделями через админку.</li>
                                           <li>Добавление и настройка действий администратора.</li>
                                       </ul>
                                       
                                       <h3>Модуль 7: Работа с внешними API</h3>
                                       <ul>
                                           <li>Введение в работу с API и RESTful сервисами.</li>
                                           <li>Использование Django Rest Framework (DRF) для создания API.</li>
                                           <li>Подключение к внешним API и интеграция данных.</li>
                                       </ul>
                                       
                                       <h3>Модуль 8: Тестирование и отладка</h3>
                                       <ul>
                                           <li>Основы тестирования в Django.</li>
                                           <li>Создание и выполнение тестов для моделей, видов и форм.</li>
                                           <li>Использование отладчика и логирования для диагностики ошибок.</li>
                                       </ul>
                                       
                                       <h3>Модуль 9: Развертывание приложений</h3>
                                       <ul>
                                           <li>Подготовка приложения к развертыванию.</li>
                                           <li>Настройка серверов и баз данных для продакшн-среды.</li>
                                           <li>Развертывание на различных хостинговых платформах (Heroku, AWS, DigitalOcean и др.).</li>
                                           <li>Основы обеспечения безопасности и производительности.</li>
                                       </ul>
                                       
                                       <h2>Результаты обучения</h2>
                                       <p>После завершения курса студенты смогут:</p>
                                       <ul>
                                           <li>Понимать и использовать основные компоненты Django.</li>
                                           <li>Разрабатывать полнофункциональные веб-приложения с использованием Django.</li>
                                           <li>Эффективно работать с базами данных и моделями данных.</li>
                                           <li>Создавать динамичные и интерактивные пользовательские интерфейсы.</li>
                                           <li>Настраивать и использовать административный интерфейс Django.</li>
                                           <li>Интегрировать приложения с внешними сервисами и API.</li>
                                           <li>Проводить тестирование и отладку приложений.</li>
                                           <li>Развертывать Django-приложения на сервере и обеспечивать их безопасность и производительность.</li>
                                       </ul>
                                       
                                       <h2>Для кого этот курс</h2>
                                       <p>Этот курс подходит для начинающих и опытных разработчиков, знакомых с основами Python, и желающих углубить свои знания в веб-разработке с использованием Django. Независимо от вашего уровня опыта, этот курс поможет вам создать масштабируемые, безопасные и эффективные веб-приложения.</p>
                                   </div>
                               </body>
                               </html>
                               """, webViewHeight: $webViewHeight)
                .frame(height: webViewHeight + 100)
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
            
            header
                .frame(maxHeight: .infinity, alignment: .top)
            
            ForgotPasswordBottomButton(title: "Записаться") {
                //
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
       }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    RouterView { _ in
        CourseDetailView()
    }
}

extension CourseDetailView {
    
    private var header: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.theme.background)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? .black.opacity(0.001) : Color.theme.secondaryText.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                
        }
        .foregroundStyle(Color.theme.accent)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
}
