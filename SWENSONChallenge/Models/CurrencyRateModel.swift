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
    let base, date: String
    let rates: [String: Double]
}
