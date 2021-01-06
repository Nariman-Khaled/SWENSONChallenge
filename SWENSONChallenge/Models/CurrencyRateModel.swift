//
//  CurrencyRateModel.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import Foundation

// MARK: - CurrencyRateModel
struct CurrencyRateModel : Codable {
    let success: Bool
    let timestamp: Int
    var base, date: String
    let rates: [String: Double]
}

struct CurrencyRateErrorModel : Codable {
    let success: Bool
        let error: CurrencyError
}

struct CurrencyError: Codable {
    let code: Int
    let type: String
}
