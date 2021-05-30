//
//  WelcomeViewController.swift
//  Login App MVC
//
//  Created by Yuriy Martinovskiy on 28.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    var userName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userName = self.userName else { return }
        welcomeLabel.text = "Welcome, \(userName)!"
        logOutButton.layer.cornerRadius = 15
    }

    @IBAction func logOutTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
}
