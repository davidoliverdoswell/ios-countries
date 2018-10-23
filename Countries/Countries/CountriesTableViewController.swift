//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by David Doswell on 10/23/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
