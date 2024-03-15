//
//  Friends-Feed.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-02-28.
//
import UIKit

class FriendsView: UIView {
    
    var friendData: FriendsFeedModal?
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
        guard let token = MoodStorage.token else {
            print("No token found")
            return
        }
        print("Token for fetching friend feed:", token)
        NetworkManager.shared.callingAPI(withToken: token) { [weak self] (data, error) in
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

// MARK: - UITableViewDataSource Methods

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
