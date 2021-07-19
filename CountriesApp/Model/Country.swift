//
//  Country.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 18/07/21.
//

struct Country: Codable {
    let name: String
    let capital: String
    let flag: String?
    let region: String
    let subregion: String
    let nativeName: String?
    let timezones: [String]?
    let currencies: [Currency]?
}

struct Currency: Codable {
    let code: String?
    let name: String?
    let symbol: String?
}

