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
    
    func setupBaseController(name : String){
        currRateModel?.base = name
    }
    
    var availableBaseCurrencies : [rates]{
       
         let baseCurrencyCode = Constants.InitialInfo.InitialBaseCurrency
            var baseFlag : UIImage?
            let baseCountryInfo = IsoCountryCodes.searchByCurrency(baseCurrencyCode).first
            if let flag = Flag(countryCode: baseCountryInfo?.alpha2 ?? "" ) {
                baseFlag = flag.image(style: .roundedRect)
            }
        let EUR = rates(code: baseCurrencyCode, rateValue: nil, flag: baseFlag)
        
        
        let USDCurrencyCode = Constants.InitialInfo.USDBaseCurrency
           var USDFlag : UIImage?
           let USDCountryInfo = IsoCountryCodes.searchByCurrency(USDCurrencyCode).first
           if let flag = Flag(countryCode: USDCountryInfo?.alpha2 ?? "" ) {
            USDFlag = flag.image(style: .roundedRect)
           }
       let USD = rates(code: USDCurrencyCode, rateValue: nil, flag: USDFlag)
       
        
        
            return [EUR , USD]
        
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
    
    func loadData(completion : @escaping (String , Bool)->()){
        APIManager.LoadBaseCurrencyRates(base : self.baseCurrencyInfo.code) {[weak self] ratesResult , ratesErrorResult, error in
            print ("Done")
            if ratesResult != nil {
                self?.currRateModel = ratesResult
                self?.getRates()
                completion("" , true)
            }
            
            else{
                if let errorMessage =  ratesErrorResult?.error.type {
                    completion( errorMessage , false)
                }
                else{
                    completion("" , false)
                }
                
            }
            
        }
    }
    
    func calculateAmoutWithSelectedRate(amount : Double) -> Double {
        let result = amount * (selectedRate?.rateValue ?? 1)
        return result
    }
}
