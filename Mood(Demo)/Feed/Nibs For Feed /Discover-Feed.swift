
import UIKit

class DiscoverView: UIView, UITableViewDataSource {
    
    var discoverData: DiscoverModel?
    
    @IBOutlet var discoverTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        fetchDataForDiscover()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fetchDataForDiscover()
    }
    
    private func commonInit() {
        
        let nib = UINib(nibName: "Discover", bundle: nil)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
        
        discoverTableView.dataSource = self
        
        discoverTableView.register(UINib(nibName: "DiscoverCell", bundle: nil), forCellReuseIdentifier: "discoverCell")
    }
    
    func fetchDataForDiscover(){
        guard let token = UserDefaults.standard.string(forKey: "userToken") else {
            print("No token found")
            return
        }
        print("Token for fetching discover feed:", token)
        NetworkManager.shared.callingAPIForDiscover(withToken: token) { [weak self] (data, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            if let data = data {
                self.discoverData = data
                DispatchQueue.main.async {
                    self.discoverTableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discoverData?.discoverFeeds.data.count ?? 0
        //return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "discoverCell", for: indexPath) as! DiscoverCell
        if  let dat = discoverData?.discoverFeeds.data[indexPath.row]
         {cell.configureCell(with: dat)}
         return cell
    }
}
