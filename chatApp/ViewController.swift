//
//  ViewController.swift
//  chatApp
//
//  Created by Nitin Singh on 27/05/22.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if emailTextField.text != "" && passwordTextField.text != "" && rePasswordTextField.text != "" {
            
            if passwordTextField.text == rePasswordTextField.text {
                registerUser()
            } else {
                ProgressHUD.showError("Password and Confirm Password does not match")
            }
            
          
        } else {
            ProgressHUD.showError("All fields are mandatory")
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            loginUser()
        } else {
            ProgressHUD.showError("E-main and Password are mandatory")
        }
    }
    
    
    @IBAction func backgroundTapped(_ sender: UIButton) {
    }
    

    //Helping functions
    
    
    func loginUser() {
        ProgressHUD.show("Login...")
        FUser.loginUserWith(email: emailTextField.text!, password: passwordTextField.text!){
            (error) in
            
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            
            self.executeApp()
        }
        
    }
    
    func registerUser() {
        print("register")
    }
    
    func cleanTextFields() {
        rePasswordTextField.text = ""
        passwordTextField.text = ""
        emailTextField.text = ""
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func executeApp() {
        ProgressHUD.dismiss()
        cleanTextFields()
        dismissKeyboard()
    
    }
}

