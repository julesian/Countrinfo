//
//  CountryLanguage.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import RealmSwift

@objcMembers class CountryLanguage: Object, Decodable {
    dynamic var id: String?
    dynamic var name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    override required init() {
        super.init()
    }
}
