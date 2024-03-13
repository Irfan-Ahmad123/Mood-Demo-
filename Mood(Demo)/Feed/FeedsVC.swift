//
//  FeedsVC.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-02-28.
//

import UIKit

class FeedsVC: UIViewController {
    

    @IBAction func logOut(_ sender: UIBarButtonItem) {
        let destroyUserToken = UserDefaults.standard.removeObject(forKey: "userToken")
        print("Token Destroy from UserDefaults:", destroyUserToken)
        performSegue(withIdentifier: "loggedOut", sender: nil)
    }
    @IBOutlet var discoverView: DiscoverView!
    @IBOutlet var friendView: FriendsView!
    @IBOutlet weak var popularView: PopularView!
    @IBOutlet weak var followingView: FollowingView!
    
    @IBOutlet var stackBtns: UIStackView!
    @IBOutlet var mainBtns: [UIButton]!
    @IBOutlet var discoverBtn: UIButton!
    @IBOutlet var friendBtn: UIButton!
    @IBOutlet var followingBtn: UIButton!
    @IBOutlet var popularBtn: UIButton!
    
    @IBAction func discoverBtn(_ sender: UIButton) {
        selectButton(sender, selectedView: discoverView)
    }
    @IBAction func friendBtn(_ sender: UIButton) {
        selectButton(sender, selectedView: friendView)
    }
    @IBAction func followingBtn(_ sender: UIButton) {
        selectButton(sender, selectedView: followingView)
    }
    @IBAction func popularBtn(_ sender: UIButton) {
        selectButton(sender, selectedView: popularView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func selectButton(_ selectedButton: UIButton, selectedView: UIView) {
        let buttons = [discoverBtn, friendBtn, followingBtn, popularBtn]
        
        for button in buttons {
            if button == selectedButton {
                button?.backgroundColor = .systemOrange
                button?.setTitleColor(.white, for: .normal)
            } else {
                button?.backgroundColor = .white
                button?.setTitleColor(.lightGray, for: .normal)
            }
        }
        
        discoverView.isHidden = selectedView != discoverView
        friendView.isHidden = selectedView != friendView
        popularView.isHidden = selectedView != popularView
        followingView.isHidden = selectedView != followingView
            
    }
    
    private func configureUI(){
        
        discoverView.isHidden = false
        friendView.isHidden = true
        
        stackBtns.layer.cornerRadius = 10
        stackBtns.layer.shadowColor = UIColor.black.cgColor
        stackBtns.layer.shadowOpacity = 0.5
        stackBtns.layer.shadowOffset = CGSize(width: 0, height: 2)
        stackBtns.layer.shadowRadius = 4
        
        for button in mainBtns{
            button.layer.cornerRadius = 10
        }
        selectButton(discoverBtn, selectedView: discoverView)
        
    }
}
