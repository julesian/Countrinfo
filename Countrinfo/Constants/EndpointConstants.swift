//
//  EndpointConstants.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import Foundation

struct EndpointConstants {
    enum Country {
        // Endpoint Base
        static let BASE = "https://restcountries.com"
        static let LATEST_VERSION = "3.1"
        static let LATEST_BASE = "\(BASE)/v\(LATEST_VERSION)"
        
        // Fetchers
        static let ALL = "\(LATEST_BASE)/all"
    }
    
}


