//
//  CountryViewModel.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 18/07/21.
//

import Foundation
import UIKit

protocol CountryProtocol {
    var name: String  { get }
    var capital: String  { get }
    var flagImageUrl: String?  { get }
    var region: String  { get }
    var subregion: String  { get }
    var nativeName: String?  { get }
    var timezones: [String]?  { get }
    var currencies: [Currency]?  { get }
}

struct CountryViewModel: CountryProtocol {
    var name: String
    var capital: String
    var flagImageUrl: String?
    var region: String
    var subregion: String
    var nativeName: String?
    var timezones: [String]?
    var currencies: [Currency]?
    
    //Dependency Injection
    init(country: Country) {
        self.name = country.name
        self.capital = country.capital
        self.flagImageUrl = country.flag
        self.region = country.region
        self.subregion = country.subregion
        self.nativeName = country.nativeName
        self.timezones = country.timezones
        self.currencies = country.currencies
    }
}
