//
//  Following.swift
//  Mood(Demo)
//
//  Created by Zain on 2024-03-06.
//

import UIKit

class FollowingView: UIView{
    
    let myFollowig = [
        Following(imageFollowing: "mee", labelTitle: "Irfan"),
        Following(imageFollowing: "faizan", labelTitle: "Faizan"),
        Following(imageFollowing: "asad", labelTitle: "Asad"),
        Following(imageFollowing: "abdullahme", labelTitle: "Abdullah")]
    
    @IBOutlet var followingCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        let nib = UINib(nibName: "Following", bundle: nil)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
        followingCollectionView.delegate = self
        followingCollectionView.dataSource = self
        followingCollectionView.register(UINib(nibName: "FollowingCollectionCell", bundle: nil), forCellWithReuseIdentifier: "followingCell")
    }
}
extension FollowingView:
    UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myFollowig.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "followingCell", for: indexPath) as! FollowingCollectionCell
        let data = myFollowig[indexPath.row]
        cell.Configure(data: data)
        return cell
    }
    
    
}
