//
//  Extension.swift
//  Login App MVC
//
//  Created by Yuriy Martinovskiy on 30.05.2021.
//

import UIKit

extension LoginViewController {
    func alertWindow(Title title: String, Message message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            if passwordTextField.text == "Password" {
        
            switch userNameTextField.text {
            case "User1":
                index = 0
            case "User2":
                index = 1
            default:
                alertWindow(Title: "Error", Message: "Incorrect username or password!")
            }
            performSegue(withIdentifier: "toWelcomeScreenSegue", sender: nil)
            } else {
                alertWindow(Title: "Error", Message: "Incorrect username or password!")
            }
            
        }
        return true
    }
}
