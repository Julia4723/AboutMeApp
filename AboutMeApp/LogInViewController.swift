//
//  ViewController.swift
//  AboutMeApp
//
//  Created by user on 08.03.2024.
//

import UIKit



final class LogInViewController: UIViewController {
    
    @IBOutlet var textFieldUserName: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        addTapGestureToHideKeyboard()
        
    }
    
    func addTapGestureToHideKeyboard() {
            let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
            view.addGestureRecognizer(tapGesture)
        } //Метод для скрытия клавы по тапу

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let logOutVC = segue.destination as? LogOutViewController
        logOutVC?.userName = textFieldUserName.text
    }
    
    @IBAction func logInButton() {
        
        guard let inputTextUserName = textFieldUserName.text, !inputTextUserName.isEmpty else {
            showAlert(withTitle: "Login is empty", andMessage: "Please, enter your login") //Здесь проверяем заполнено ли поле с именем, если нет, то алерт
            return
        }
        
        guard let inputTextPassword = textFieldPassword.text, !inputTextPassword.isEmpty else {
            showAlert(withTitle: "Password is empty", andMessage: "Please, enter your password") //Здесь проверяем заполнено ли поле с паролем
            return
        }
        
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
    }
    
    
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
            self.textFieldPassword.text = "" // Здесь стираем текст в пое=ле с паролем после закрытия алерта
        }
        alert.addAction(okAction)
    }
    

    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        textFieldPassword.text = ""
        textFieldUserName.text = ""
        
    }
    

}

