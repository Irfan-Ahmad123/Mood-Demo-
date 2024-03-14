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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
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
        activityIndicator.startAnimating()
        let networkManager = NetworkManager()
        guard let email = logInUserEmail.text, !email.isEmpty,
              let password = logInUserPassword.text, !password.isEmpty else {
            showAlert(with: "Please enter email and password.")
            activityIndicator.stopAnimating()
            
            return
        }
        
        networkManager.loginUser(email: email, password: password) { error in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            if let error = error {
                DispatchQueue.main.async {
                    self.showAlert(with: "Invalid Email or Password. Please enter valid credentials")
                    print("Error thhe occurred: \(error.localizedDescription)")
                }
            } else {
                print("Login successful")
                DispatchQueue.main.async {
                    
                    self.checkTokenAndNavigate()
                }
            }
        }
    }
    
    private func checkTokenAndNavigate() {
        if let token = UserDefaults.standard.string(forKey: "userToken") {
            print("Token for fetching from Login:", token)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
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

