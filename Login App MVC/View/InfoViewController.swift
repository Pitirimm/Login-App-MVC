//
//  InfoViewController.swift
//  Login App MVC
//
//  Created by Yuriy Martinovskiy on 29.05.2021.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var name: String?
    var surname: String?
    var age: Int?
    var descriptionUser: String?
    var userPhoto: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let name = self.name else { return }
        guard let surname = self.surname else { return }
        guard let descriptionUser = self.descriptionUser else { return }
        guard let age = self.age else { return }
        nameLabel.text = "\(name)"
        surnameLabel.text = "\(surname)"
        descriptionLabel.text = "\(descriptionUser)"
        ageLabel.text = "\(age) years"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.imageAva = userPhoto
    }
   

}
