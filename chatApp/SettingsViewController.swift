//
//  SettingsViewController.swift
//  chatApp
//
//  Created by Nitin Singh on 05/06/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        FUser.logOutCurrentUser { success in
            
            if success {
                self.showLoginView()
            }
        }
    }
    
    func showLoginView() {
        
        let rootVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcome")
        rootVc.modalPresentationStyle = .fullScreen
        self.present(rootVc, animated: true, completion: nil)
    }
}
