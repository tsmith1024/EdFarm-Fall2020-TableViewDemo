//
//  CustomAnimalCell.swift
//  TableViewDemo
//
//  Created by Taylor Smith on 11/5/20.
//

import UIKit

class CustomAnimalCell: UITableViewCell {
    @IBOutlet weak var pictureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
