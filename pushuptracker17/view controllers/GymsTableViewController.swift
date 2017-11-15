//
//  GymsTableViewController.swift
//  pushuptracker17
//
//  Created by Ismayil Hasanov on 11/13/17.
//  Copyright © 2017 GWU. All rights reserved.
//

import UIKit

class GymsTableViewController: UITableViewController {
    
    var gyms = [Gym]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gymFinder = GymFinder()
        gymFinder.delegate = self
        
        gymFinder.fetchNearbyGyms()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gyms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gymCell", for: indexPath) as! GymTableViewCell

        // Configure the cell...
        let gym = gyms[indexPath.row]
        cell.gymNameLabel.text = gym.name
        cell.gymAddressLabel.text = gym.address
        cell.gymAddressLabel.textColor = .gray
        cell.gymLogoImageView.downloadFrom(urlString: gym.logoUrlString)

        return cell
    }
}

extension GymsTableViewController: NearbyGymDelegate {
    func gymsFound(_ gyms: [Gym]) {
        self.gyms = gyms
        
        // Run in the main thread
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func gymsNotFound() {
        print("no gyms :-(")
    }
    
    
}
