
import UIKit

class DiscoverView: UIView, UITableViewDataSource {
    
    let data = [
        TabelData(profileImage: "abdullahme", userName: "Abdullah", date: "Sat, 14 January • ", time: "04:00" , address: "NewCanal Park Phase 3 tajbagh", event: "Mehndi", btnTitle: "Joined"),
        
        TabelData(profileImage: "asad", userName: "Asad Ali", date: "Wednesday, 02 Febvuary • ", time: "11:30", address: "Lahore akhri Mint Stop, BaghwanPura", event: "Barat", btnTitle: "Join"),
        
        TabelData(profileImage: "faizan" ,userName: "Faizan Ahmad", date: "Tues, 22 December • ", time: "18:22", address: "Tajbagh Lahore", event: "Birthday", btnTitle: "Joined"),
        
        TabelData(profileImage: "gullu", userName: "Gull Sher", date: "Fri, 14 August • ", time: "13:04", address: "Tajpura Scheme Fategarh", event: "Spring Seen", btnTitle: "Joined"),
        
        TabelData(profileImage: "mee", userName: "Irfan Ahmad", date: "Mon, 14 May • ", time: "21:00", address: "House 55 tajbagh harbancpura", event: "Barat", btnTitle: "Join")
    ]
    
    @IBOutlet var discoverTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
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
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "discoverCell", for: indexPath) as! DiscoverCell
        let dat = data[indexPath.row]
        cell.configureCell(with: dat)
        return cell
        
    }
}
