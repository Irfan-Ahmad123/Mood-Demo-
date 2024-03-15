//
//  FriendsCell.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-02-28.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet var friendProfilepic: UIImageView!
    @IBOutlet var friendName: UILabel!
    @IBOutlet var friendTime: UILabel!
    @IBOutlet var friendComment: UILabel!
    @IBOutlet var friendLike: UILabel!
    @IBOutlet var friendMainImage: UIImageView!
    @IBOutlet var friendEvent: UILabel!
    @IBOutlet var joinBtn: UIButton!
    @IBOutlet var lockPick: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizingUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(with data : Friend){
        if let address = data.activityAddress{
            self.friendEvent.text = address
        }
        if let name = data.activityTitle{
            self.friendName.text = name
        }
        if let time = data.createdAt?.convertToDisplayFormat(){
            self.friendTime.text = time
        }
    }
    
    private func customizingUI() {
        joinBtn.layer.cornerRadius = 10
        joinBtn.layer.shadowRadius = 4
        joinBtn.layer.borderColor = UIColor.black.cgColor
        joinBtn.layer.borderWidth = 1
        lockPick.layer.cornerRadius = lockPick.frame.size.width/2
        friendProfilepic.layer.cornerRadius = friendProfilepic.frame.size.width/2
    }
}
