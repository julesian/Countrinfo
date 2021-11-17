//
//  CountryManager.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import Foundation

import Alamofire
import RxSwift

protocol CountryRepositoryProtocol {
    func fetchAll(success: @escaping ((_ countries: [Country]) -> Void),
                  failure: @escaping ((_ error: Error) -> Void))
    func fetchAllCached(query: String?) -> [Country]
}

struct CountryRepository: CountryRepositoryProtocol {
    
    // Ideally endpoint should have a limited / ranged fetch to control data stream, this also comes with a fetch with minimal data relevant only for list display
    // then there would be another endpoint for fetching the remaining details for the Country
    
    public func fetchAll(success: @escaping ((_ countries: [Country]) -> Void),
                         failure: @escaping ((_ error: Error) -> Void)) {
        AFHelper.request(urlString: EndpointConstants.Country.ALL, success: { json in
            guard let objects = JSONModelHelper.parse(json: json, decodable: [Country].self) as? [Country]
            else {
                assertionFailure("Failed to parse \(Country.className())")
                return
            }
            
            RealmManager.shared.createOrUpdate(objects)
            
            let fetchedObjects = CountryDAO.fetchAll()
            success(fetchedObjects)
        }, failure: { error in
            failure(error)
        })
    }
    
    public func fetchAllCached(query: String? = "") -> [Country] {
        CountryDAO.fetchAll(query: query)
    }
}
