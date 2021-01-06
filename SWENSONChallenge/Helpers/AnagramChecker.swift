//
//  AnagramChecker.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import Foundation

class AnagramChecker {
    
   class func checkForAnagram(firstString: String, secondString: String) -> Bool {
        let adjustedFirstString  = firstString.lowercased().trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "")
    let adjustedSecondString  = secondString.lowercased().trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "")
    
    
        let isAnagram = adjustedFirstString.sorted() == adjustedSecondString.sorted()
        
        return isAnagram
    }
    
}
