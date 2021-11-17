//
//  CountryCurrency.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import Foundation

import RealmSwift

@objcMembers class CountryCurrency: Object, Decodable {
    dynamic var name: String?
    dynamic var symbol: String?
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case symbol
    }
    
    override required init() {
        super.init()
    }
}
