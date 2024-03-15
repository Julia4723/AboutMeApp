//
//  BioViewController.swift
//  AboutMeApp
//
//  Created by user on 10.03.2024.
//

import UIKit

class BioViewController: UIViewController {
    
    @IBOutlet var titleItem: UILabel!
    @IBOutlet var descriptionBio: UILabel!
    
    var user = User.getUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleItem.text = "\(user.persons.myName) \(user.persons.surname)"
        descriptionBio.text = user.persons.description

    }
}
