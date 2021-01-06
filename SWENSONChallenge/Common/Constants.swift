//
//  Constants.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

struct Constants {
    struct FixerConfigurations {
        static let access_key = "b42d4a69627de3eb341434be44315e23"
        static let Fixer_baseURL = "http://data.fixer.io/api/"
    }
    
    struct endPoints {
        static let latestRates = "latest"
    }
    struct queryParamters {
        static let accessKey = "access_key"
        static let baseCurrency = "base"
    }
    
    struct StoryBoardId {
        static let CurrencyCalculator = "CurrencyCalculatorVC"
        static let BaseCurrencySelection = "BaseCurrencySelectionVC"
    }
    
    struct CellsIdentifiers {
        static let ratesCell = "rateCell"
        static let currencySelectionCell = "currencyCell"
    }
    
    struct InitialInfo {
        static let InitialBaseCurrency = "EUR"
        static let USDBaseCurrency = "USD"
    }
    
}
