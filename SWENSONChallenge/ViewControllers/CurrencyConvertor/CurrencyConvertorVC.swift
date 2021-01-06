//
//  CurrencyConvertorVC.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit
import FlagKit

class CurrencyConvertorVC: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var lblStaticTitle: UILabel!
    @IBOutlet weak var imgBaseFlag: UIImageView!
    @IBOutlet weak var lblBaseCode: UILabel!
    
    
    
    var currencyViewModel : CurrencyConvertorViewModel?
    
    @IBOutlet weak var tbvRates: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       // let countryCode = Locale.current.regionCode!
        let flag = Flag(countryCode: "EU")!

        // Retrieve the unstyled image for customized use
        let originalImage = flag.originalImage
        imgBaseFlag.image = originalImage
        
    }
    
    
    


}

extension CurrencyConvertorVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyViewModel?.rates.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rateCell = tableView.dequeueReusableCell(withIdentifier: "rateCell") else {
            return UITableViewCell()
        }
        
       // let rateData = currencyRateInfo?.rates[indexPath.row]
        
        return rateCell
        
    }
   
    
    
}
