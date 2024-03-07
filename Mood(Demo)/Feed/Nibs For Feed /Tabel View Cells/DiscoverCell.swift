//
//  DiscoverCell.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-02-28.
//

import UIKit

class DiscoverCell: UITableViewCell {

    @IBOutlet var userProfileImage: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var userAddressLabel: UILabel!
    @IBOutlet var userEventName: UILabel!
    @IBOutlet var buttonTitleLabel: UIButton!
    @IBOutlet var followerImages: [UIImageView]!
    @IBOutlet var iii: UIImageView!
    @IBOutlet var profileMii: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUIElements()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func configureCell(with data : TabelData){
        userProfileImage.image = UIImage(named: data.profileImage)
        userNameLabel.text = data.userName
        dateLabel.text = data.date
        timeLabel.text = data.time
        userAddressLabel.text = data.address
        userEventName.text = data.event
        buttonTitleLabel.titleLabel?.text = data.btnTitle
    }
    func configureUIElements(){
        iii.layer.cornerRadius = iii.frame.size.width/2
        profileMii.layer.cornerRadius = profileMii.frame.size.width/2
        buttonTitleLabel.layer.cornerRadius = 10
        buttonTitleLabel.layer.shadowColor = UIColor.black.cgColor
        buttonTitleLabel.layer.shadowOpacity = 0.5
        buttonTitleLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        buttonTitleLabel.layer.shadowRadius = 4
        userProfileImage.layer.cornerRadius = userProfileImage.frame.size.width/2
        for images in followerImages{
            images.layer.cornerRadius = images.frame.size.width/2
            images.layer.borderColor = UIColor.systemOrange.cgColor
            images.layer.borderWidth = 2
        }
    }
}

