//
//  PaymentHisCell.swift
//  Dubai KMCC
//
//  Created by Augmenta on 28/12/20.
//

import UIKit

class PaymentHisCell: UITableViewCell {

    @IBOutlet var viewBack: UIView!
    
    @IBOutlet var lblCardType: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblAmount: UILabel!
    
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
