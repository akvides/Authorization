//
//  LoginViewController.swift
//  Authorization
//
//  Created by Василий Полторак on 05.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 18
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = User.getUsers()[0].name
                welcomeVC.surname = User.getUsers()[0].surname
            } else if let settingsVC = viewController as? SettingsViewController {
                settingsVC.login = User.getUsers()[0].login
                settingsVC.name = User.getUsers()[0].name
                settingsVC.surname = User.getUsers()[0].surname
                settingsVC.age = User.getUsers()[0].age
            }
        }
        
        view.endEditing(true)

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard nameTextField.text != "" else {
            presentAlertController(title: "Логин не введен", message: "Введи имя и попробуй снова")
            return false
        }
        
        guard passwordTextField.text != "" else {
            presentAlertController(title: "Не введен пароль", message: "Введи пароль")
            return false
        }
        
        guard nameTextField.text == User.getUsers()[0].login &&
                passwordTextField.text == User.getUsers()[0].password else {
            presentAlertController(title: "Не корректные данные", message: "Неправильно введен логин или пароль")
            return false
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        nameTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    func presentAlertController(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Ладно-шоколадно", style: .cancel)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true)
    }

    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField {
            
        case nameTextField:
            if textField.text == "" {
                presentAlertController(title: "Логин не введен", message: "Введи логин и попробуй снова")
            } else {
                passwordTextField.becomeFirstResponder()
            }
            
        default:
            
            if shouldPerformSegue(withIdentifier: "goToWelcomeVC", sender: nil) {
                performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
            }
            
        }
        
        return true
    }
    
}

