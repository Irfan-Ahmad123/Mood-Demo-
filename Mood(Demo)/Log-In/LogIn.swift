//
//  LogInVC.swift
//  Assignment
//
//  Created by Rashdan Natiq on 2024-02-27.
//

import UIKit

class LogInVC: UIViewController {
    
    struct userSignUpInfo : Codable {
        var fullName: String
        var age: String
        var bio: String?
        var emailAddress: String
        var password : String
    }
    
    var newSignup : [userSignUpInfo] = []
    
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
        guard let checkUserEmail = logInUserEmail.text, !checkUserEmail.isEmpty,
              let checkUserPassword = logInUserPassword.text, !checkUserPassword.isEmpty else {
            print("Please enter email and password.")
            return
        }
        
        if let encodedData = UserDefaults.standard.data(forKey: "newInfo") {
            if let decodedArray = try? JSONDecoder().decode([userSignUpInfo].self, from: encodedData) {
                newSignup = decodedArray
              
                if let matchedUser = newSignup.first(where: { $0.emailAddress == checkUserEmail && $0.password == checkUserPassword }) {
                    print("Login successful for user: \(matchedUser.fullName)")
                    // Perform segue or other actions upon successful login here
                    performSegue(withIdentifier: "loggedIn", sender: self)
                } else {
                    print("Invalid email or password. Please try again.")
                }
            }
        } else {
            print("No user data found.")
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
        
    }
    
}

