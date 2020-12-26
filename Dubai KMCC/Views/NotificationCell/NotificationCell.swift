//
//  NotificationCell.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet var viewBack: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewBack.layer.borderColor = UIColor.borderColor.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
