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
        
        guard nameTextField.text != "" else {
            presentAlertController(title: "Имя не заполнено", message: "Введи имя и попробуй снова")
            return
        }
        
        guard passwordTextField.text != "" else {
            presentAlertController(title: "Не введен пароль", message: "Введи пароль")
            return
        }
        
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.name = nameTextField.text
        
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
            
        case passwordTextField:
            if textField.text == "" {
                presentAlertController(title: "Не введен пароль", message: "Введи пароль")
            } else {
                performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
            }
            
        default:
            break // Я согласен с логикой Алексея по поводу того чтобы не оставлять ничего лишнего, однако считаю что в подобном алгоритме использование двух строчек для явного определения всех текстовых полей, не такая большая цена =)
            
        }
        
        return true
    }
    
}

