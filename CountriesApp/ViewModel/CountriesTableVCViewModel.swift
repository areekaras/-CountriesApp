//
//  CountriesTableVCViewModel.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 20/07/21.
//

enum CountriesTableVCError: Error {
    case noDataFound
}

class CountriesTableVCViewModel {
    func fetchData(completion: @escaping (Result<[Country], CountriesTableVCError>) -> ()) {
        Network.fetchData { (countries, error) in
            if let _ = error {
                completion(.failure(.noDataFound))
            } else {
                completion(.success(countries ?? []))
            }
        }
    }
}
