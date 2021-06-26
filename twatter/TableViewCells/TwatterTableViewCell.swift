//
//  TwatterTableViewCell.swift
//  twatter
//
//  Created by Abba on 26/06/2021.
//

import UIKit

class TwatterTableViewCell: UITableViewCell {

    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var attachButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
