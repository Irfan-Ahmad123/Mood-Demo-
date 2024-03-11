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

class SignUpVC: UIViewController,UITextFieldDelegate {
    
    var newSignup : [userSignUpInfo] = []
    var bioText:String?
    
    @IBOutlet var signUpFullName: UITextField!
    @IBOutlet var signUpDate: UITextField!
    @IBOutlet var signUpEmail: UITextField!
    @IBOutlet var signUpPassword: UITextField!
    @IBOutlet var signUpNextBtn: UIButton!
    @IBAction func signUpDate(_ sender: Any) {
        guard let textField = sender as? UITextField, let text = textField.text else {
                return
            }

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: text), dateFormatter.string(from: date) == text {
                
            } else {
                showAlert(with: "Please enter a valid date in the format YYYY-MM-DD")
            }    }
    @IBAction func signUpNextBtnTapped(_ sender: UIButton) {
        guard let password = signUpPassword.text, isPasswordValid(password) else {
                        showAlert(with: "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.")
                        return
                    }
        performSegue(withIdentifier: "toSignUp1", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        signUpEmail.delegate = self
        signUpPassword.delegate = self
        signUpFullName.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == signUpEmail {
            // Validate email format
            guard let email = textField.text, validateEmail(email) else {
                showAlert(with: "Please enter a valid email address.")
                return
            }
        }else if textField == signUpFullName {
            // Validate username
            guard let username = textField.text, !username.isEmpty else {
                showAlert(with: "Username cannot be empty.")
                return
            }
        }
    }
    func saveDataOfUser(){
        guard let fullName = signUpFullName.text,
                 let age = signUpDate.text,
                 let emailAddress = signUpEmail.text,
                 let password = signUpPassword.text
           else {
               return
           }
           // If both email and password are valid, proceed with sign-up
           let newUser = userSignUpInfo(fullName: fullName, age: age, bio: bioText, emailAddress: emailAddress, password: password)
           newSignup.append(newUser)

           if let encodedData = try? JSONEncoder().encode(newSignup) {
               UserDefaults.standard.set(encodedData, forKey: "newInfo")
           }

        
    }
    
   private func showAlert(with message: String) {
           let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
       }
    
     func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate = dateFormatter.string(from: sender.date)
        signUpDate.text = selectedDate
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        let passwordRegex = "(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).{8,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           if textField == signUpPassword {
               textField.resignFirstResponder()
               signUpNextBtnTapped(signUpNextBtn)
               return true
           }
           return false
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

