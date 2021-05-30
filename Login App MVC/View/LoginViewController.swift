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
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
        
    }
    
    @IBAction func logIn(_ sender: UIButton) {
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
    
    @IBAction func forgotUNTapped(_ sender: UIButton) {
        alertWindow(Title: "Hint", Message: "Your user name is User1 or User2")
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


