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
    
    var userName: String! //Создаем свойства для экземпляра класса

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName //Здесь передаем имя юзера в лейбл на экран log out

    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true) // Метод для закрытия экрана по кнопке.
        
    }
    
}
