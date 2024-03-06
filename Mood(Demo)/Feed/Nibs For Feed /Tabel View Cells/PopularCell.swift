//
//  PopularCell.swift
//  Mood(Demo)
//
//  Created by Zain on 2024-03-06.
//

import UIKit

struct Popular {
    let imageProfile: String
    let title: String
    let place: String
    let description: String
    let imagePost: String
}

class PopularCell: UITableViewCell {
    
    

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPlace: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var btnJoin: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgProfile.layer.masksToBounds = true
        imgProfile.layer.cornerRadius = imgProfile.frame.height / 2
        
        btnJoin.layer.cornerRadius = 12
        btnJoin.clipsToBounds = true
        btnJoin.layer.borderWidth = 1
        btnJoin.layer.borderColor = UIColor.black.cgColor
    }
    
    func configure(data: Popular){
        self.imgProfile.image = UIImage(named: data.imageProfile)
        self.lblTitle.text = data.title
        self.lblPlace.text = data.place
        self.lblDescription.text = data.description
        self.imgPost.image = UIImage(named: data.imagePost)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
