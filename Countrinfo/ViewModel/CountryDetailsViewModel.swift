//
//  CountryDetailsViewModel.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import UIKit

struct CountryDetailsViewModel {
    let country: Country

    var officialName: String {
        return DisplayHelper.getName(from: country.name?.official)
    }
    
    var commonName: String {
        let name = DisplayHelper.getName(from: country.name?.common)
        return "or commonly known as \(name)"
    }
    
    var unitedNationsMembership: Bool {
        return country.unMember
    }
    
    var region: String {
        return DisplayHelper.getName(from: country.region)
    }
    
    var subregion: String {
        return DisplayHelper.getName(from: country.subregion)
    }
    
    var languages: String {
        let languages = country.languages.compactMap { $0.name }
        var text = "people here can speak "
        for language in languages {
            if language.count > 1 {
                if language != languages.first {
                    text.append(",")
                }
                if language == languages.last {
                    text.append(" and ")
                }
            }
            text.append(language)
        }
        return text
    }
    
    var languageCount: String {
        return "\(String(country.languages.count)) \(country.languages.count > 1 ? "Languages" : "Language")"
    }
    
    var capital: String {
        var text = ""
        let capitals = country.capital
        for capital in capitals {
            if capital.count > 1,
                capital != capitals.first {
                text.append(" | ")
            }
            text.append(capital)
        }
       return text
    }
    
    var capitalInfo: String {
        return "the capital \(country.capital.count > 1 ? "cities" : "city")"
    }
    
    var population: String {
        return country.population.withCommas()
    }
    
    var populationFlair: String {
        let population = country.population
        if population > 10000000 {
            return "total population, that's a lot!"
        } else if population > 1000000 {
            return "total population, a decent amount"
        } else {
            return "total population, anybody out there?"
        }
    }
    
    var timezones: [String] {
        let timezones = Array(country.timezones)
        return timezones
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
    
    init(from viewModel: CountryItemViewModel) {
        self.country = viewModel.country
    }
}
