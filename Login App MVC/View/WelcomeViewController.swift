//
//  WelcomeViewController.swift
//  Login App MVC
//
//  Created by Yuriy Martinovskiy on 28.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userName = self.userName else { return }
        welcomeLabel.text = "Welcome, \(userName)!"
    }

    @IBAction func logOutTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
}
