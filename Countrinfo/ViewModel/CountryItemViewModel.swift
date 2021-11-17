//
//  CountryItemViewModel.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import UIKit

struct CountryItemViewModel {
    let country: Country
    
    var name: String {
        let name = country.name?.common ?? country.name?.official ?? country.cca2
        return DisplayHelper.getName(from: name)
    }
    
    var flagURL: URL? {
        // TODO: Process if SVGs, not yet sure of performance impact so png for the meantime, I usually use pdf for vectors / scalable images
        for flag in country.flags {
            if flag.type == "png",
               let url = flag.url {
                return URL(string: url)
            }
        }
        return nil
    }
    
    var placeHolderFlag: UIImage? {
        return UIImage(named: "icon_flag_general")
    }
    
    init(from model: Country) {
        self.country = model
    }
}
