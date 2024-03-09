//
//  LogOutViewController.swift
//  AboutMeApp
//
//  Created by user on 08.03.2024.
//

import UIKit

final class LogOutViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName //Здесь передаем имя юзера в лейбл на экран log out

    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true)
        
    }
    
}
