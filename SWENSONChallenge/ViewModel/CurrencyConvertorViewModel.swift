//
//  CurrencyConvertorViewModel.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import Foundation
import UIKit
import FlagKit

struct rates {
    var code: String?
    var rateValue: Double?
    var flag : UIImage?
}

class CurrencyConvertorViewModel {
    
    private var currRateModel: CurrencyRateModel?
    var ratesArr: [rates] = []
    var selectedRate : rates?
    
    var isSuccess: Bool {
        return currRateModel?.success ?? false
    }
    
    var baseCurrencyInfo: ( code : String , flag : UIImage? )   {
        let baseCurrencyCode = currRateModel?.base ?? Constants.InitialInfo.InitialBaseCurrency
        var baseFlag : UIImage?
        let CountryInfo = IsoCountryCodes.searchByCurrency(baseCurrencyCode).first
        if let flag = Flag(countryCode: CountryInfo?.alpha2 ?? "" ) {
            baseFlag = flag.image(style: .roundedRect)
        }
        
        return (baseCurrencyCode , baseFlag)
    }
    
    
    
  private func getRates() {
        let ratesDic = currRateModel?.rates ?? [:]
        for (currencyCode, value) in ratesDic {
            var countryFlag : UIImage?
            let CountryInfo = IsoCountryCodes.searchByCurrency(currencyCode).first
            if let flag = Flag(countryCode: CountryInfo?.alpha2 ?? "" ) {
                countryFlag = flag.image(style: .roundedRect)
            }
            ratesArr.append(rates(code: currencyCode, rateValue: value,flag: countryFlag))
        }
    }
    
    func loadData(completion : @escaping (Bool)->()){
        APIManager.LoadBaseCurrencyRates(base : self.baseCurrencyInfo.code) {[weak self] result , error in
            print ("Done")
            if result != nil {
                self?.currRateModel = result
                self?.getRates()
                completion(true)
            }
            else{
                completion(false)
            }
            
        }
    }
    
    func calculateAmoutWithSelectedRate(amount : Double) -> Double {
        let result = amount * (selectedRate?.rateValue ?? 1)
        return result
    }
}
