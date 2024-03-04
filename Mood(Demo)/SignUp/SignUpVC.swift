//
//  SignUPVC.swift
//  Assignment
//
//  Created by Rashdan Natiq on 2024-02-27.
//

import UIKit

struct userSignUpInfo : Codable {
    var fullName: String
    var age: String
    var bio: String?
    var emailAddress: String
    var password : String
}

class SignUpVC: UIViewController {
    
    var newSignup : [userSignUpInfo] = []
    var bioText:String?
    
    @IBOutlet var signUpFullName: UITextField!
    @IBOutlet var signUpAge: UITextField!
    @IBOutlet var signUpEmail: UITextField!
    @IBOutlet var signUpPassword: UITextField!
    @IBOutlet var signUpNextBtn: UIButton!
    @IBAction func signUpNextBtnTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toSignUp1", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func saveDataOfUser(){
        guard let fullName = signUpFullName.text,
              let age = signUpAge.text,
              let emailAddress = signUpEmail.text,
              let password = signUpPassword.text
        else{
            return
        }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        guard emailPredicate.evaluate(with: emailAddress) else {
            
            let alert = UIAlertController(title: "Invalid Email", message: "Please enter a valid email address.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        guard isPasswordValid(password) else {
            let alert = UIAlertController(title: "Invalid Password", message: "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let newUser = userSignUpInfo(fullName: fullName, age: age, bio: bioText, emailAddress: emailAddress, password: password)
        
        newSignup.append(newUser)
        
        if let encodedData = try? JSONEncoder().encode(newSignup) {
            UserDefaults.standard.set(encodedData, forKey: "newInfo")
            
        }
    }
    func isPasswordValid(_ password: String) -> Bool {
        let passwordRegex = "(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).{8,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    func configureUI(){
 
        signUpNextBtn.layer.cornerRadius = 20
        signUpNextBtn.layer.shadowColor = UIColor.black.cgColor
        signUpNextBtn.layer.shadowOpacity = 0.5
        signUpNextBtn.layer.shadowOffset = CGSize(width: 0, height: 2)
        signUpNextBtn.layer.shadowRadius = 4
        
        signUpPassword.isSecureTextEntry = true
    }
}

