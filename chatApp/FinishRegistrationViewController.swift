//
//  FinishRegistrationViewController.swift
//  chatApp
//
//  Created by Nitin Singh on 31/05/22.
//

import UIKit
import ProgressHUD
import simd

class FinishRegistrationViewController: UIViewController {
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var email: String = ""
    var password: String = ""
    var avatarImage: UIImage?
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        dismissKeyboard()
        ProgressHUD.show("Registering...")
        
        
        if nameTextField.text != "" && surnameTextField.text != "" && countryTextField.text != "" && cityTextField.text != "" && phoneTextField.text != "" {
            
            FUser.registerUserWith(email: email, password: password, firstName: nameTextField.text!, lastName: surnameTextField.text!) { (error) in
                
                if error != nil {
                    ProgressHUD.dismiss()
                    ProgressHUD.showError(error!.localizedDescription)
                    return
                }
                
                self.registerUser()
            }
            
        } else {
            ProgressHUD.showError("All Fields are mandatory")
        }
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        cleanTextFields()
        dismissKeyboard()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func registerUser() {
        
        let fullName = nameTextField.text! + " " + surnameTextField.text!
        
        var tempDictionary: Dictionary = [kFIRSTNAME: nameTextField.text!, kLASTNAME:surnameTextField.text!, kFULLNAME: fullName, kCOUNTRY: countryTextField.text!, kCITY: cityTextField.text!, kPHONE: phoneTextField.text!] as [String : Any]
        
        
        if avatarImage == nil {
            imageFromInitials(firstName: nameTextField.text!, lastName: surnameTextField.text!) {
                (avatatInitials) in
                
                let avatarImage = avatatInitials.jpegData(compressionQuality: 0.7)
                let avatar = avatarImage!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
                
                
                tempDictionary[kAVATAR] = avatar
                self.finishRegistration(withValues: tempDictionary)
            }
            
        } else {
            
            let avatarData = avatarImage?.jpegData(compressionQuality: 0.7)
            let avatar = avatarData!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
            
            
            tempDictionary[kAVATAR] = avatar
            self.finishRegistration(withValues: tempDictionary)
        }
        
    }
    
    func finishRegistration(withValues: [String:Any]) {
        
        updateCurrentUserInFirestore(withValues: withValues) {(error) in
            if error != nil {
                DispatchQueue.main.async {
                    ProgressHUD.showError(error!.localizedDescription)
                }
                return
            }
            ProgressHUD.dismiss()
            self.callToMainScreen()
        }
    }
    
    func callToMainScreen() {
        cleanTextFields()
        dismissKeyboard()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: USER_DID_LOGIN_NOTIFICATION), object: nil, userInfo: [kUSERID: FUser.currentId()])
        
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainApplication")
        as! UITabBarController
        
        mainView.modalPresentationStyle = .fullScreen
        self.present(mainView, animated: true,completion: nil)
    }
    
    func cleanTextFields() {
        surnameTextField.text = ""
        nameTextField.text = ""
        phoneTextField.text = ""
        countryTextField.text = ""
        cityTextField.text = ""
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
