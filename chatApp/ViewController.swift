//
//  ViewController.swift
//  chatApp
//
//  Created by Nitin Singh on 27/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        print("register")
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("login")
    }
    
    
    @IBAction func backgroundTapped(_ sender: UIButton) {
    }
    

    //Helping functions
    
    func cleanTextFields() {
        rePasswordTextField.text = ""
        passwordTextField.text = ""
        emailTextField.text = ""
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

