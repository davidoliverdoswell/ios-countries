//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by David Doswell on 10/23/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    var countriesController: CountriesController?
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesController?.countries.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country = countriesController?.countries[indexPath.row]
        cell.textLabel?.text = country?.name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let navVC = segue.destination as! UINavigationController
            let detailVC = navVC.topViewController as! CountriesDetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            guard let countries = countriesController?.countries else { return }
            detailVC.country = countries[indexPath.row]
        }
    }
    

}
