//
//  CurrencyConvertorViewModel.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import Foundation

struct rates {
    var code: String?
    var value: Double?
}

class CurrencyConvertorViewModel {
    
    var currRateModel: CurrencyRateModel?
    var ratesArr: [rates] = []
    
    init(rateModel: CurrencyRateModel) {
        self.currRateModel = rateModel
        getRates()
    }
    
    
    
    var isSuccess: Bool {
        return currRateModel?.success ?? false
    }
    
    var base: String {
        return currRateModel?.base ?? "EN"
    }
    
    func getRates() {
        let ratesDic = currRateModel?.rates ?? [:]
        for (rate, value) in ratesDic {
            ratesArr.append(rates(code: rate, value: value))
        }
    }
    
    func loadData (){
        APIManager.LoadBaseCurrencyRates(base : "EUR") {[weak self] result , error in
            print ("Done")
            if result != nil {
                self?.currencyViewModel = result
                self?.tbvRates.reloadData()
            }
        }
    }
}
