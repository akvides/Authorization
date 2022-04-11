//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Василий Полторак on 05.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Hello \(name ?? "")"
    }
    
}
