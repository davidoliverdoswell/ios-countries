//
//  CountriesController.swift
//  Countries
//
//  Created by David Doswell on 10/23/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation

private let baseURL = URL(string: "https://restcountries.eu/rest/v2/name/")!

class CountriesController {
    
    private(set) var countries : [Country] = []
    
    enum RequestMethod: String {
        case get
    }
    
    func fetchCountries(completion: @escaping (Error?) -> Void) {
        let url = baseURL
            .appendingPathExtension("json")
        
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error: \(error)")
                completion(error)
                return
            }
            guard let data = data else {
                completion(NSError())
                return
            }
            do {
                let countries = try JSONDecoder().decode([String : Country].self, from: data)
                let country = countries.map({$0.value})
                self.countries = country
            } catch {
                NSLog("Error: \(error)")
            }
            completion(nil)
            
        }.resume()
        
    }
    
    
    
}
