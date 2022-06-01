//
//  FinishRegistrationViewController.swift
//  chatApp
//
//  Created by Nitin Singh on 31/05/22.
//

import UIKit

class FinishRegistrationViewController: UIViewController {
    @IBOutlet weak var surnameTextField: UIStackView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var phoneTextField: UIStackView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UIStackView!
    @IBOutlet weak var nameTextField: UIStackView!
    
    var email: String = ""
    var password: String = ""
    var avatarImage: UIImage?
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(email)
        print(password)
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
    }
    
}
