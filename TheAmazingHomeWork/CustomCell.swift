//
//  CustomCell.swift
//  TheAmazingHomeWork
//
//  Created by Владимир Сухора on 31.07.22.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
        
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    var currentColor: UIColor = .red
    var callBack: ((UIColor) -> ())?
    
    override func prepareForReuse() {
        mainView.backgroundColor = nil
        mainLabel.text = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    func setUpView(with color: UIColor) {
        mainView.backgroundColor = color
    }
    
    func setUpLabel(with text: String) {
        mainLabel.text = text
    }
    @IBAction func changeColorButton(_ sender: Any) {
        currentColor = mainView.backgroundColor ?? .red
        callBack?(currentColor)
    }
}
