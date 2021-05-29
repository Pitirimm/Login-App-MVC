//
//  ViewController.swift
//  Login App MVC
//
//  Created by Yuriy Martinovskiy on 28.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let member = User.getUserData()
    var index = 0

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        switch userNameTextField.text {
        case "User1":
            index = 0
        case "User2":
            index = 1
        default:
            alertWindow(Title: "Error", Message: "Wrong!")
        }
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
        guard let navigationVC = destinationViewController.viewControllers?[1] as? UINavigationController else { return }
        guard let infoVC = navigationVC.topViewController as? InfoViewController else { return }
        
        welcomeVC.userName = member[index].person.fullname
        infoVC.name = member[index].person.name
        infoVC.surname = member[index].person.surname
        infoVC.descriptionUser = member[index].person.description
        infoVC.age = member[index].person.age
        infoVC.userPhoto = member[index].person.image
        
    }
}

