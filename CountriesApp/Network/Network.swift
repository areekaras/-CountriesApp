//
//  Network.swift
//  RestCountriesApi
//
//  Created by Shibili Areekara on 17/07/21.
//

import Foundation

class Network {
    func fetchData(completion: @escaping (([Country]) -> ())) {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let countryModels = try JSONDecoder().decode([Country].self, from: data)
                
                completion(countryModels)
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
        
    }
}
