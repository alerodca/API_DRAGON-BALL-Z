//
//  LoginViewController.swift
//  Proyecto
//
//  Created by Alejandro Rodríguez Cañete on 9/6/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else {
            print("email is empty")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            print("password is empty")
            return
        }
        
        NetworkLayer.shared.login(email: email, password: password) { token, error in
            if let token = token {
                LocalDataLayer.shared.save(token: token)
                print("We got a valid token")
                print(token)
                
                DispatchQueue.main.async {
                    // Deprecated Form
                    //UIApplication.shared.keyWindow?.rootViewController = HomeTabBarController()
                
                    UIApplication
                        .shared
                        .connectedScenes
                        .compactMap{($0 as? UIWindowScene)?.keyWindow}
                        .first?
                        .rootViewController = HomeTabBarController()
                }
                
            } else {
                print("Login Error: ", error?.localizedDescription ?? "")
            }
        }
    }
    
}
