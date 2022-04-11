//
//  SettingsViewController.swift
//  Authorization
//
//  Created by Василий Полторак on 11.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var displayedSurname: UIButton!
    
    private let userDefaults = UserDefaults.standard
    private let notificationCenter = NotificationCenter.default
    
    var login: String!
    var name: String!
    var surname: String!
    var age: Int!
    
    private var surnameDisplay: Bool!
    
    private let enableImage = UIImage(systemName: "circle.inset.filled")
    private let disableImage = UIImage(systemName: "circle")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginLabel.text = login
        nameLabel.text = name
        surnameLabel.text = surname
        ageLabel.text = String(age)
        
        surnameDisplay = userDefaults.bool(forKey: "surnameDisplay")
        displaySurname()
        
    }
    
    @IBAction func setupDisplayedSurname() {
        
        surnameDisplay = !surnameDisplay
        displaySurname()
        userDefaults.set(surnameDisplay, forKey: "surnameDisplay")
        self.notificationCenter.post(name: NSNotification.Name("updateWelcomeText"), object: nil)
        
    }
    
    private func displaySurname() {
        
        if surnameDisplay {
            displayedSurname.setImage(enableImage, for: .normal)
        } else {
            displayedSurname.setImage(disableImage, for: .normal)
        }
    }
    
}
