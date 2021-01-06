//
//  RateCell.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit

class RateCell: UITableViewCell {

    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var lblCurrencyCode: UILabel!
    @IBOutlet weak var lblCurrencyRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWithRate(rate : rates){
        lblCurrencyCode.text = rate.code
        lblCurrencyRate.text = String(format:"%.2f", rate.rateValue ?? 0.0)
        imgFlag.image = rate.flag
    }

}
