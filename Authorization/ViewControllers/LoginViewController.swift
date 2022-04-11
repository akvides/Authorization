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
    
//    private let login = "Vasilii"
//    private let password = "qwerty"
    private let login = "V"
    private let password = "q"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 18
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
        let tabBarController = segue.destination as! UITabBarController
//
//        tabBarController.viewControllers
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = nameTextField.text
            }
        }
        
        view.endEditing(true)
        
//        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
//        welcomeVC.name = nameTextField.text
//        
//        view.endEditing(true)

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard nameTextField.text != "" else {
            presentAlertController(title: "Имя не заполнено", message: "Введи имя и попробуй снова")
            return false
        }
        
        guard passwordTextField.text != "" else {
            presentAlertController(title: "Не введен пароль", message: "Введи пароль")
            return false
        }
        
        guard nameTextField.text == login && passwordTextField.text == password else {
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
                presentAlertController(title: "Имя не заполнено", message: "Введи имя и попробуй снова")
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

