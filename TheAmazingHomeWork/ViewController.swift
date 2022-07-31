//
//  ViewController.swift
//  TheAmazingHomeWork
//
//  Created by Владимир Сухора on 7.07.22.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpTableView()
    }
}
private extension ViewController {
    func setUpTableView() {
        let customCell = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(customCell, forCellReuseIdentifier: "CustomCell")
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        cell.callBack = { color in
            self.view.backgroundColor = color
            self.tableView.backgroundColor = color
        }
        cell.setUpView(with: .random)
        cell.setUpLabel(with: "\(indexPath.row)")
        return cell
    }
}
extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
