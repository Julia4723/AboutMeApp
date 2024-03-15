//
//  LogOutViewController.swift
//  AboutMeApp
//
//  Created by user on 08.03.2024.
//

/*
 Когда создаем новый класс в коде для нового вью контроллера надо в параметрах Identity Inspectior прописать имя файла
 */

import UIKit

final class WelcomeScreenViewController: UIViewController {
    
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var myNameLabel: UILabel!
    
    var user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        userNameLabel.text = "Welcome \(user.name)"
        myNameLabel.text = "My name is \(user.persons.myName)"
    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true) // Метод для закрытия экрана по кнопке.
        
    }
    
}
