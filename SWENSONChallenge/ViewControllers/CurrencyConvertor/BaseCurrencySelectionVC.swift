//
//  BaseCurrencySelectionVC.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit

class BaseCurrencySelectionVC: UIViewController {

    //MARK:- IBoutlets
    var  currencyViewModel : CurrencyConvertorViewModel?
    @IBOutlet weak var lblTitle: UILabel!
    
    
    //MARK:- viewcontroller lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

   //MARK:- setup views
    func setupViews (){
        lblTitle.text = NSLocalizedString("base selection header", comment: "")
        self.title =  NSLocalizedString("base selection header", comment: "")
    }
    
    
    //MARK:- IBActions
    
    @IBAction func closePopup(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension BaseCurrencySelectionVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyViewModel?.availableBaseCurrencies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currencyCell = tableView.dequeueReusableCell(withIdentifier:Constants.CellsIdentifiers.currencySelectionCell) as? currencySelectionCell else {
            return UITableViewCell()
        }
        
        let currencyData = currencyViewModel?.availableBaseCurrencies[indexPath.row]
        
        currencyCell.setupCell(currency:  currencyData)
        
        return currencyCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currencyData = currencyViewModel?.availableBaseCurrencies[indexPath.row]
        if let newCode = currencyData?.code {
            currencyViewModel?.setupBaseController(name:  newCode)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
