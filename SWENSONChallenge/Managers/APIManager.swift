//
//  APIManager.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import Foundation
import Alamofire


class APIManager {
    
    class func LoadBaseCurrencyRates(base : String , completion : @escaping( (CurrencyRateModel? , Error?)->())) {
        
        let URL = Constants.FixerConfigurations.Fixer_baseURL + Constants.endPoints.latestRates + "?access_key="+Constants.FixerConfigurations.access_key
        
        AF.request(URL).responseData { response in
            debugPrint(response)
            if let data =  response.data {
                do{
                    
                    completion(try JSONDecoder().decode(CurrencyRateModel.self, from: data) ,nil)
                }
                catch {
                    completion( nil, error)
                }
            }else {
                
                completion(nil , nil)
            }
        }
        
    }
    
}
