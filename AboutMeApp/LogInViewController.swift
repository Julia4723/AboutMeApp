//
//  ViewController.swift
//  AboutMeApp
//
//  Created by user on 08.03.2024.
//


/*
 Когда делаем переход по сигвею вызывается метод
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
 // Создаем экземпляр класса. Destination - ссылка по которй будем вызывать экземпляры другого класса
 
 }
 
 */

import UIKit



final class LogInViewController: UIViewController {
    
    
    @IBOutlet var textFieldUserName: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
     
    private var defaultUserName: String = "Name"
    private var defaultUserPassword: String = "1111"
    
    private var user = User.getUser()
    
    override func viewDidLoad() {
         super.viewDidLoad()

        
        textFieldUserName.text = defaultUserName
        textFieldPassword.text = defaultUserPassword
        
        
            //addTapGestureToHideKeyboard()
        
    }
    
    
    
    /* Мой вариант для скрытия клавиатуры по тапу
    func addTapGestureToHideKeyboard() {
            let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
            view.addGestureRecognizer(tapGesture)
        } //Метод для скрытия клавы по тапу
     */

     
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         super.touchesBegan(touches, with: event)
         view.endEditing(true)
     } //Скрываем клавиатуру
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let logInVC = segue.destination as? LogInViewController else { return } //Создаем экземпляр класса. Кастим его до класса куда будем передавать данные
        logInVC.defaultUserName = user.name
        logInVC.defaultUserPassword = user.password
        
        let tabBarController = segue.destination as? UITabBarController
        tabBarController?.viewControllers?.forEach { viewController in
            if let welcomeScreenVC = viewController as? WelcomeScreenViewController {
                
                welcomeScreenVC.user = user
                
                welcomeScreenVC.view.backgroundColor = .clear
                
            } else if let aboutMeVC = viewController as? AboutMeViewController {
                aboutMeVC.user = user

                aboutMeVC.view.backgroundColor = .clear
                
            }
        }
    }
 

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard textFieldUserName.text == defaultUserName, textFieldPassword.text == defaultUserPassword else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
            )
            return false
        }
        return true
    } // Валидируем значения полей
    
    
    @IBAction func logInButton() {
        
        guard let inputTextUserName = textFieldUserName.text, !inputTextUserName.isEmpty else {
            showAlert(withTitle: "Login is empty", andMessage: "Please, enter your login") //Здесь проверяем заполнено ли поле с именем, если нет, то алерт
            return
        }
        
        guard let inputTextPassword = textFieldPassword.text, !inputTextPassword.isEmpty else {
            showAlert(withTitle: "Password is empty", andMessage: "Please, enter your password") //Здесь проверяем заполнено ли поле с паролем
            return
        }
        
        
        /* Я таким образом валидировала поля (тоже работало =)))
        let userName = "Name"
        let isUserNameValid = NSPredicate(format: "SELF MATCHES %@", userName).evaluate(with: inputTextUserName)
        
        if !isUserNameValid {
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password") //Здесь алерт что неверное имя
        }
        
        let userPassword = "1111"
        let isUserPasswordValid = NSPredicate(format: "SELF MATCHES %@", userPassword).evaluate(with: inputTextPassword)
        
        if !isUserPasswordValid {
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password") // Здесь алерт что неверный пароль
        }
         */
    }
    

    
        /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let logOutVC = segue.destination as? WelcomeScreenViewController else { return }//Создаем экземпляр класса. Кастим его до класса куда будем передавать данные
        logOutVC.userName = userName //Берем свойства из класса LogOut
    }
         */
    

    
    @IBAction func forgotPaswordButton() {
        showAlert(withTitle: "Oops", andMessage: "Your password is 1111")
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is Name")
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textFieldPassword.text = "" // Здесь стираем текст в поле с паролем после закрытия алерта
        }
        alert.addAction(okAction)
    }
    

    //Метод unwind для перехода по сигвею
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        textFieldPassword.text = ""
        textFieldUserName.text = ""
        
    }

}

