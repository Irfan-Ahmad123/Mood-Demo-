//
//  Signup1.swift
//  Assignment
//
//  Created by Rashdan Natiq on 2024-02-27.
//

import UIKit

class SignUp2: UIViewController {

    var biotext:String!
    
    @IBOutlet var signUpUploadProfileImage: UIImageView!
    @IBOutlet var signUpBtnTapped: UIButton!
    @IBOutlet var uploadImg: UIButton!
    @IBOutlet var signUpBio: UITextField!
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        actionToSignIN()
        performSegue(withIdentifier: "bckToLogIN", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
       configureElements()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toSignUp1" {
                if let signUpVC = segue.destination as? SignUpVC {
                    signUpVC.bioText = signUpBio.text
                }
            }
        }
    func configureElements(){
        signUpUploadProfileImage.layer.cornerRadius = signUpUploadProfileImage.frame.size.width/2
        signUpBtnTapped.layer.cornerRadius = 20
        signUpBtnTapped.layer.shadowColor = UIColor.black.cgColor
        signUpBtnTapped.layer.shadowOpacity = 0.5
        signUpBtnTapped.layer.shadowOffset = CGSize(width: 0, height: 2)
        signUpBtnTapped.layer.shadowRadius = 4
        uploadImg.layer.cornerRadius = uploadImg.frame.size.width/2
        
    }
    func actionToSignIN(){
        if let signUpVC = navigationController?.viewControllers.first(where: { $0 is SignUpVC }) as? SignUpVC {
                  
                   signUpVC.saveDataOfUser()
            print("User information is saved")
               }
    }
}

