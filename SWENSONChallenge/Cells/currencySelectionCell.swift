//
//  currencySelectionCell.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit

class currencySelectionCell: UITableViewCell {

    
    //MARK:- IBOutlets
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgFlag: UIImageView!
    
    
    //MARK:- setup
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func setupCell(currency : rates?){
        lblTitle.text = currency?.code
        imgFlag.image = currency?.flag
    }
    
}
