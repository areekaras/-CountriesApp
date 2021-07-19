//
//  CountryDetailViewModel.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 19/07/21.
//

import Foundation

enum CountryDetailType {
    case flag, detail
}

protocol CountryDetailCellProtocol {
    var type: CountryDetailType { get }
    var label: String? { get }
    var value: String { get }
}

struct CountryDetailCellViewModel: CountryDetailCellProtocol {
    var type: CountryDetailType = .detail
    var label: String? = ""
    var value: String = ""
    
    func getDataSourceArray(countryViewModel: CountryProtocol?) -> [CountryDetailCellProtocol] {
        var result = [CountryDetailCellProtocol]()
        
        if let flagImageUrl = countryViewModel?.flagImageUrl {
            result.append(CountryDetailCellViewModel(type: .flag, label: nil, value: flagImageUrl))
        }
        
        result.append(CountryDetailCellViewModel(label: "Capital", value: countryViewModel?.capital ?? ""))
        result.append(CountryDetailCellViewModel(label: "Time zone", value: countryViewModel?.timezones?[0] ?? ""))
        
        if let currency = countryViewModel?.currencies?[0] {
            let currencyValue = "\(currency.symbol ?? "") - \(currency.name ?? "")"
            result.append(CountryDetailCellViewModel(label: "Currency", value: currencyValue))
        }
        
        result.append(CountryDetailCellViewModel(label: "Region", value: countryViewModel?.region ?? ""))
        result.append(CountryDetailCellViewModel(label: "Sub region", value: countryViewModel?.subregion ?? ""))
        result.append(CountryDetailCellViewModel(label: "Native name", value: countryViewModel?.nativeName ?? ""))
        
        return result
    }
}
