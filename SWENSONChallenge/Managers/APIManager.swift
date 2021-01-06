//
//  APIManager.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import Foundation
import Alamofire


class APIManager {
    
    class func LoadBaseCurrencyRates(base : String , completion : @escaping( (CurrencyRateModel? ,CurrencyRateErrorModel? , Error?)->())) {
        
        let baseURL = Constants.FixerConfigurations.Fixer_baseURL + Constants.endPoints.latestRates
        let accessTokenParamter =  "\(Constants.queryParamters.accessKey)=\(Constants.FixerConfigurations.access_key)"
        let baseParamter = "\(Constants.queryParamters.baseCurrency)=\(base)"
        
        let finalURL = "\(baseURL)?\(accessTokenParamter)&\(baseParamter)"
        
        
        AF.request(finalURL).responseData { response in
            debugPrint(response)
            if let data =  response.data {
                do{
                    
                    completion(try JSONDecoder().decode(CurrencyRateModel.self, from: data),nil ,nil)
                }
                catch {
                    do{
                        
                        completion(nil ,  try JSONDecoder().decode(CurrencyRateErrorModel.self, from: data) ,nil)
                    }
                    catch {
                        completion(nil , nil , error)
                    }
                }
            }else {
                
                completion(nil , nil , nil)
            }
        }
        
    }
    
}
