//
//  CountriesDetailViewController.swift
//  Countries
//
//  Created by David Doswell on 10/23/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class CountriesDetailViewController: UIViewController {
    
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var currencies: UILabel!
    @IBOutlet weak var languages: UILabel!
    @IBOutlet weak var flag: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    private func updateViews() {
        guard let country = country, isViewLoaded else { return }
        
        self.title = country.name
        region.text = country.region
        capital.text = country.capital
        population.text = country.population
        currencies.text = country.currencies
        languages.text = country.languages
        flag.image = UIImage(data: country.flag)
    }
    
    var country: Country? {
        didSet {
            updateViews()
        }
    }
    

}
