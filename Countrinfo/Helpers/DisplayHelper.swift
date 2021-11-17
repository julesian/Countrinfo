//
//  DisplayHelper.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import Foundation

struct DisplayHelper {
    
    enum Constants {
        static let placeholder = "Missing Data"
    }
    
    static func getName(from string: String?) -> String {
        guard let string = string
        else {
            return Constants.placeholder
        }
        return string
    }
}
