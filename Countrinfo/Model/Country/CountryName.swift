//
//  CountryName.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import RealmSwift

@objcMembers class CountryName: Object, Decodable {
    dynamic var common: String?
    dynamic var official: String?
    
    enum CodingKeys: String, CodingKey {
        case common
        case official
    }
    
    override required init() {
        super.init()
    }
}
