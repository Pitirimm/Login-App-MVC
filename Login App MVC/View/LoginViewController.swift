//
//  ViewController.swift
//  Login App MVC
//
//  Created by Yuriy Martinovskiy on 28.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let a = User.getUserData()[1].login

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text = a
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
  
    
    private func alertWindow(Title title: String, Message message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func logIn(_ sender: UIButton) {
        performSegue(withIdentifier: "toWelcomeScreenSegue", sender: nil)
    }
    
    @IBAction func forgotUNTapped(_ sender: UIButton) {
        alertWindow(Title: "Hint", Message: "Your user name is User")
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        alertWindow(Title: "Hint", Message: "Your password name is Password")
    }
    
    @IBAction func unwindSegueToLoginScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        guard segue.source is WelcomeViewController else { return }
        
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? UITabBarController else { return }
        guard let welcomeVC = destinationViewController.viewControllers?[0] as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTextField.text
    }
}

