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

    var searchResults: [SearchResult] = []

    
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
    
    func performSearch(with searchTerm: String, completion: @escaping (Error?) -> Void) {
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchQueryItem = URLQueryItem(name: "term", value: searchTerm)
        
        urlComponents.queryItems = [searchQueryItem]
        
        guard let requestURL = urlComponents.url else {
            NSLog("Problem constructing URL for \(searchTerm)")
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = RequestMethod.get.rawValue
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error as NSError? {
                NSLog("Error fetching data \(error)")
                completion(NSError())
                return
            }
            
            guard let data = data else {
                completion(NSError())
                NSLog("Error fetching data")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                
                let searchResults = try jsonDecoder.decode(SearchResults.self, from: data)
                self.searchResults = searchResults.results
                
                completion(nil)
            } catch {
                NSLog("Unable to decode data")
                completion(NSError())
            }
        }
        dataTask.resume()
    }
    
}
