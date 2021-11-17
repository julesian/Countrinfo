//
//  Country.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import RealmSwift

@objcMembers class Country: Object, Decodable {
    dynamic var cca2: String?
    dynamic var name: CountryName?
    dynamic var unMember: Bool = false
    dynamic var region: String?
    dynamic var subregion: String?
    let languages = List<CountryLanguage>()
    let capital = List<String>()
    dynamic var population: Double = 0
    let timezones = List<String>()
    let flags = List<CountryFlag>()
    
    enum CodingKeys: String, CodingKey {
        case cca2
        case name
        case unMember
        case region
        case subregion
        case languages
        case capital
        case population
        case timezones
        case flags
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        cca2 = try? container.decode(String.self, forKey: .cca2)
        name = try? container.decode(CountryName.self, forKey: .name)
        unMember = try container.decode(Bool.self, forKey: .unMember)
        region = try? container.decode(String.self, forKey: .region)
        languages.append(objectsIn: Country.decodeLanguages(from: container))
        capital.append(objectsIn: Country.decodeCapital(from: container))
        subregion = try? container.decode(String.self, forKey: .subregion)
        timezones.append(objectsIn: Country.decodeTimezones(from: container))
        population = try container.decode(Double.self, forKey: .population)
        timezones.append(objectsIn: Country.decodeTimezones(from: container))
        flags.append(objectsIn: Country.decodeFlags(from: container))
    }
    
    override static func primaryKey() -> String? {
        return CodingKeys.cca2.rawValue
    }
    
    override required init() {
        super.init()
    }
    
    // MARK: Array Decoders
    
    static func decodeLanguages(from container: KeyedDecodingContainer<CodingKeys>) -> [CountryLanguage]{
        var array = [CountryLanguage]()
        if let languages = try? container.decode([String: String].self, forKey: .languages) {
            for (id, name) in languages {
                let language = CountryLanguage()
                language.id = id
                language.name = name
                array.append(language)
            }
        }
        return array
    }
    
    static func decodeCapital(from container: KeyedDecodingContainer<CodingKeys>) -> [String] {
        var array = [String]()
        if let capitals = try? container.decode([String].self, forKey: .capital) {
            for capital in capitals {
                array.append(capital)
            }
        }
        return array
    }
    
    static func decodeTimezones(from container: KeyedDecodingContainer<CodingKeys>) -> [String] {
        var array = [String]()
        if let timezones = try? container.decode([String].self, forKey: .timezones) {
            for timezone in timezones {
                array.append(timezone)
            }
        }
        return array
    }
    
    static func decodeFlags(from container: KeyedDecodingContainer<CodingKeys>) -> [CountryFlag] {
        var array = [CountryFlag]()
        if let flags = try? container.decode([String: String].self, forKey: .flags) {
            for (type, url) in flags {
                let flag = CountryFlag()
                flag.type = type
                flag.url = url
                array.append(flag)
            }
        }
        return array
    }
}
