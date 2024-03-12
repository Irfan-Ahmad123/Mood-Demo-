//
//  LogInVC.swift
//  Assignment
//
//  Created by Rashdan Natiq on 2024-02-27.
//

import UIKit

struct Login {
    let token: String
}

class LogInVC: UIViewController {
    
    
    //var newSignup : [userSignUpInfo] = []
    
    @IBOutlet var logInUserEmail: UITextField!
    @IBOutlet var logInUserPassword: UITextField!
    @IBOutlet var signInBtnTapped: UIButton!
    @IBOutlet var singUpBtnTapped: UIButton!
    @IBAction func signInBtnTapped(_ sender: Any) {
        signIN()
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func signIN(){
        let networkManager = NetworkManager()
        guard let email = logInUserEmail.text, !email.isEmpty,
              let password = logInUserPassword.text, !password.isEmpty else {
            print("Please enter email and password.")
            return
        }
        
        networkManager.loginUser(email: email, password: password) { error in
            if let error = error {
                print("Error occurred: \(error.localizedDescription)")
            } else {
                print("Login successful")
                DispatchQueue.main.async {
                    
                    self.performSegue(withIdentifier: "loggedIn", sender: self)
                }
            }
        }
    }

    private func configureUI(){
        
        singUpBtnTapped.layer.cornerRadius = 20
        singUpBtnTapped.layer.shadowColor = UIColor.black.cgColor
        singUpBtnTapped.layer.shadowOpacity = 0.5
        singUpBtnTapped.layer.shadowOffset = CGSize(width: 0, height: 2)
        singUpBtnTapped.layer.shadowRadius = 4
        
        signInBtnTapped.layer.cornerRadius = 20
        signInBtnTapped.layer.shadowColor = UIColor.black.cgColor
        signInBtnTapped.layer.shadowOpacity = 0.5
        signInBtnTapped.layer.shadowOffset = CGSize(width: 0, height: 2)
        signInBtnTapped.layer.shadowRadius = 4
        
        logInUserPassword.isSecureTextEntry = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    private func showAlert(with message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
}

