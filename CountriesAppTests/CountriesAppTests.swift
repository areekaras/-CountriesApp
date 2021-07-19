//
//  CountriesAppTests.swift
//  CountriesAppTests
//
//  Created by Shibili Areekara on 18/07/21.
//

import XCTest
@testable import CountriesApp

class CountriesAppTests: XCTestCase {


    func testCountryViewModel() {
        let currency = Currency(code: "EUR", name: "Euro", symbol:"€")
        let country = Country(name: "Andorra", capital: "Andorra la Vella", flag: "https://restcountries.eu/data/and.svg", region: "Europe", subregion: "Southern Europe", nativeName: "Andorra", timezones: ["UTC+01:00"], currencies: [currency])
        
        let countryViewModel = CountryViewModel(country: country)
        
        XCTAssertEqual(country.name, countryViewModel.name)
        XCTAssertEqual(country.capital, countryViewModel.capital)
        XCTAssertEqual(country.flag, countryViewModel.flagImageUrl)
        XCTAssertEqual(country.region, countryViewModel.region)
        XCTAssertEqual(country.subregion, countryViewModel.subregion)
        XCTAssertEqual(country.nativeName, countryViewModel.nativeName)
    }
}
