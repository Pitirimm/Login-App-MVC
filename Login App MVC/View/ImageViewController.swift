//
//  ImageViewController.swift
//  Login App MVC
//
//  Created by Yuriy Martinovskiy on 29.05.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    
    var imageAva:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = self.imageAva else { return }
        photoView.image = UIImage(named: image)

    }

}
