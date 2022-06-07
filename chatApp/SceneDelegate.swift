//
//  SceneDelegate.swift
//  chatApp
//
//  Created by Nitin Singh on 27/05/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if Auth.auth().currentUser != nil {
            window.rootViewController = storyboard.instantiateViewController(withIdentifier: "mainApplication")
        } else {
            window.rootViewController = storyboard.instantiateViewController(withIdentifier: "welcome")
        }
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
     
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }
    
    func sceneWillResignActive(_ scene: UIScene) {

    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }
    
    
}

