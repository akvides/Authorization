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
    var surname: String!
    
    private let userDefaults = UserDefaults.standard
    private let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self,
                                       selector: #selector(updateWelcomeText),
                                       name: NSNotification.Name("updateWelcomeText"),
                                       object: nil)
        
        updateWelcomeText()
        
    }
    
    @objc func updateWelcomeText() {
        if userDefaults.bool(forKey: "surnameDisplay") {
            nameLabel.text = "Привет \(name!) \(surname!)"
        } else {
            nameLabel.text = "Привет \(name!)"
        }
    }
    

    
}

extension WelcomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        User.getUsers()[0].collection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BoardGameTableViewCell
        
        let boardGame = User.getUsers()[0].collection[indexPath.row]
        
        if boardGame.image != "" {
            cell.gameImageView.image = UIImage(named: boardGame.image)
        }
        cell.gameNameLabel.text = boardGame.name
        cell.gameWeightLabel.text = "Сложность: \(boardGame.weight.rawValue)"
        cell.playingTimeLabel.text = "\(boardGame.playingTime) мин."
        
        return cell
    }
    
    
}
