//
//  CountriesDetailViewController.swift
//  Countries
//
//  Created by David Doswell on 10/23/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class CountriesDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

    }
    
    private func updateViews() {
        guard let country = country, isViewLoaded else { return }
        
        title = country.name
    }
    
    var country: Country? {
        didSet {
            updateViews()
        }
    }

}
