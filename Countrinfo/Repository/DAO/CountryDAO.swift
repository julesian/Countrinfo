//
//  CountryDAO.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import RealmSwift

struct CountryDAO {
    
    enum Order {
        case ascending
        case descending
    }
    
    static func fetchAll(query: String? = "") -> [Country] {
        var objects = RealmManager.shared.read(Country.self)
        
        if let query = query,
           !query.isEmpty {
            objects = objects.filter("""
                                     name.common CONTAINS[cd] %@ OR
                                     name.official CONTAINS[cd] %@
                                     """, query, query, query)
        }
            
        objects = order(objects, .ascending)
        let array = Array(objects)
        /*
        objects = filter(objects, with: query)
        objects = order(objects, .ascending)
         */
        return array
    }
    
    static func order(_ objects: Results<Country>, _ order: Order) -> Results<Country> {
        return objects.sorted(byKeyPath: "name.common", ascending: order == .ascending)
    }
    
    /* No predicates XD, has safe checks
     
    // Searches for Common name and Official name properties
    static func filter(_ objects: [Country], with query: String? = "") -> [Country] {
        var filteredObjects = objects
        
        if let query = query?.lowercased(),
           !query.isEmpty {
            filteredObjects = objects.filter {
                // Matches
                var common = false
                var official = false
                var cca2 = false
                // Checking
                if let name = $0.name {
                    common = (name.common?.lowercased() ?? "").contains(query)
                    official = (name.official?.lowercased() ?? "").contains(query)
                }
                return common || official
            }
        }
        
        return filteredObjects
    }
    
    static func order(_ objects: [Country], _ order: Order) -> [Country] {
        return objects.sorted { first, second in
            switch order {
            case .ascending: return name(from: first) < name(from: second)
            case .descending: return name(from: first) > name(from: second)
            }
        }
    }
    
    static func name(from country: Country?) -> String {
        guard let name = country?.name
        else {
            return country?.cca2 ?? ""
        }
        return name.common ?? name.official ?? ""
    }
    */
    
}
