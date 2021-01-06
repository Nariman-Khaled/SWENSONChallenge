//
//  CurrencyCalculatorVC.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit

class CurrencyCalculatorVC: UIViewController {

    //MARK:- IBOutlets
    
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var lblBaseCurrencyCode: UILabel!
    
    @IBOutlet weak var lblTargetCurrenceResult: UILabel!
    @IBOutlet weak var lblTargetCurrencyCode: UILabel!
    
    //MARK:- variables
    var currencyViewModel : CurrencyConvertorViewModel?
    
    
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    //MARK:- Setup
    func setupViews(){
    //    setupHeader()
        setupLocalizations()
        setupWithInitialValues()
    }
    
    func setupLocalizations(){
        lblHeader.text = NSLocalizedString("Header", comment: "")
    }
    
    func setupHeader(){
        let overlayColor = UIColor.PrimaryOceanColor
        let overlayedImage = btnClose.image(for: .normal)?.overlayImage(color: overlayColor)
           btnClose.setImage(overlayedImage, for: .normal)
    }

    func setupWithInitialValues(){
        txtAmount.delegate = self
        lblBaseCurrencyCode.text = currencyViewModel?.baseCurrencyInfo.code
        
        lblTargetCurrencyCode.text = currencyViewModel?.selectedRate?.code
        lblTargetCurrenceResult.text =  String(format:"%.2f", currencyViewModel?.selectedRate?.rateValue ?? 0.0) 
        txtAmount.text = "1.0"
    }
    
    //MARK:- IBActions
    @IBAction func CloseScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- TextField handling
    
    
}

extension CurrencyCalculatorVC : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
                  let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            let result =  currencyViewModel?.calculateAmoutWithSelectedRate(amount: Double( updatedText) ?? 0.0)
            lblTargetCurrenceResult.text = String(format:"%.2f",result ?? 0.0)
            }
        return true
    }
    
    
}
