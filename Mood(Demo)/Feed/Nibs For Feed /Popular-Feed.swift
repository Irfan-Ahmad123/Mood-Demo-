//
//  Popular.swift
//  Mood(Demo)
//
//  Created by Zain on 2024-03-06.
//

import UIKit
class PopularView: UIView{
    
    let myPopular: [Popular] = [
        Popular(imageProfile: "aa", title: "Vasaparken", place: "Place", description: "Is one of the most popular places in Stockholm. ", imagePost: "aa"),
        Popular(imageProfile: "bb", title: "Protest for Gun Control", place: "Mood", description: "320 people are in the Mood to Protest for gun control in Saturday at Sergels Torg. ", imagePost: "bb"),
        Popular(imageProfile: "cc", title: "Cafe Opera", place: "Place", description: "Cafe Opera is popular with 200 Check ins", imagePost: "cc")
    ]
    
    @IBOutlet weak var popularTaleViewCell: UITableView!
    //@IBOutlet var discoverTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        let nib = UINib(nibName: "Popular", bundle: nil)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
        popularTaleViewCell.dataSource = self
        popularTaleViewCell.register(UINib(nibName: "PopularCell", bundle: nil), forCellReuseIdentifier: "popularCell")
    }
}

extension PopularView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPopular.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "popularCell", for: indexPath) as! PopularCell
        //tableViewPopular.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        let x = myPopular[indexPath.row]
        cell.configure(data: x)
        return cell
    }
}
