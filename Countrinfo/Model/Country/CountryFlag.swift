//
//  CountryFlag.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import RealmSwift

@objcMembers class CountryFlag: Object, Decodable {
    dynamic var type: String?
    dynamic var url: String?
    // dynamic var nativeNames: [String: String]?
    

    enum CodingKeys: String, CodingKey {
        case type
        case url
        // case nativeNames = "nativeName"
    }
    
    override required init() {
        super.init()
    }
}

