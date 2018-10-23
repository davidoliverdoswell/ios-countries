//
//  Country.swift
//  Countries
//
//  Created by David Doswell on 10/23/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation

struct Country: Codable, Equatable {
    var name: String
    var region: String
    var capital: String
    var population: String
    var currencies: String
    var languages: String
    var flag: Data
}

struct SearchResult: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct SearchResults: Codable {
    let results: [SearchResult]
}

