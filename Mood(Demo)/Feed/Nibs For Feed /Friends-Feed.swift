//
//  Friends-Feed.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-02-28.
//
import UIKit

class FriendsView: UIView {
    var friendData: FriendsFeedModal?
    let data = [
        Data(profileImage: "mee", userName: "Irfan Ahmad", time: "2 hour ago ", event: " Birthday ", mainimg: "mee", likes: "112", comments: "40"),
        
        Data(profileImage: "abdullahme", userName: "Abdullah", time: "5 hours ago", event: "Waleema", mainimg: "abdullahme", likes: "400", comments: "40"),
        
        Data(profileImage: "faizan", userName: "Faizan Ahmad", time: "20 hours ago", event: "Barat", mainimg: "faizan", likes: "800", comments: "9834"),
        
        Data(profileImage: "gullu", userName: "Gull Sher", time: "21 hours ago", event: "Basketball", mainimg: "gullu", likes: "2500", comments: "233")
    ]
    
    @IBOutlet var friendsTabelView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        fetchData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fetchData()
    }
    
    private func commonInit() {
        
        let nib = UINib(nibName: "Friends", bundle: nil)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
        
        friendsTabelView.dataSource = self

        friendsTabelView.register(UINib(nibName: "FriendsCell", bundle: nil), forCellReuseIdentifier: "friendCell")
    }
    func fetchData(){
            NetworkManager.callingAPI{ [weak self] (data, error) in
                guard let self = self else { return }
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                if let data = data {
                    self.friendData = data
                    DispatchQueue.main.async {
                        self.friendsTabelView.reloadData()
                    }
                }
            }
        }
}
extension FriendsView:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendData?.friendsfeed.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsCell
       if  let dat = friendData?.friendsfeed.data[indexPath.row]
        {cell.configureCell(with: dat)}
        return cell
    
    }
}
