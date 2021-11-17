//
//  AFHelper.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import Foundation
import Alamofire

class AFHelper {
    class func request(urlString: String,
                       parameters: Parameters? = nil,
                       success: @escaping ((_ response: Any) -> Void),
                       failure: @escaping ((_ error: Error) -> Void)) {
        AF.request(urlString, parameters: parameters).responseJSON { response in
            if response.value != nil {
                success(response.value as Any)
            }
            
            if response.error != nil {
                let error = response.error?.underlyingError
                failure(error!)
            }
        }
    }
}
