//
//  HistoryTableViewCell.swift
//  VisualHeart
//
//  Created by user on 2022/05/25.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    //ラベル設定
    @IBOutlet var historyDateLabel: UILabel!
    @IBOutlet var historyTextLabel: UILabel!
    @IBOutlet var historyColorImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
