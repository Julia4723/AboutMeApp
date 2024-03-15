//
//  AboutMeViewController.swift
//  AboutMeApp
//
//  Created by user on 10.03.2024.
//

import UIKit

final class AboutMeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    @IBOutlet var photoView: UIView!
    
    var user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.text = user.persons.myName
        surnameLabel.text = user.persons.surname
        hobbyLabel.text = user.persons.hobby
        
        photoView.layer.cornerRadius = photoView.frame.width / 2
        
    }

}
