//
//  GymFinder.swift
//  pushuptracker17
//
//  Created by Ismayil Hasanov on 11/13/17.
//  Copyright © 2017 GWU. All rights reserved.
//

import Foundation

protocol NearbyGymDelegate {
    func gymsFound(_ gyms: [Gym])
    func gymsNotFound()
}

class GymFinder {
    
    var delegate: NearbyGymDelegate?
    
    func fetchNearbyGyms() {
        let requestURL = URL(string: "https://s3.amazonaws.com/files.jared-alexander.com/fake_gym_data/gymdata.json")!
        let urlRequest = URLRequest(url: requestURL)
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) -> Void in
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                if let data = data, let gymJsonArray = try? JSONSerialization.jsonObject(with: data, options: []) {
                    
                    if let gymJsonArray = gymJsonArray as? [[String:Any]] {
                        var gyms = [Gym]()
                        
                        for gymJsonObject in gymJsonArray {
                            // parse data from JSON
                            let gymName = gymJsonObject["name"] as? String ?? ""
                            let gymAddress = gymJsonObject["address"] as? String ?? ""
                            let gymImageUrl = gymJsonObject["image_url"] as? String ?? ""
                            
                            let gym = Gym(name: gymName, address: gymAddress, logoUrlString: gymImageUrl)
                            gyms.append(gym)
                        }
                        
                        //TODO: handle success
                        self.delegate?.gymsFound(gyms)
                    }
                    else {
                        //TODO: handle failure - Incorrect JSON array
                        self.delegate?.gymsNotFound()
                    }
                }
                else {
                    //TODO: handle failure - JSON serialization failed
                    self.delegate?.gymsNotFound()
                }
            }
            else {
                //TODO: handle failure - response status code is NOT 200
                self.delegate?.gymsNotFound()
            }
        }
        
        task.resume()
    }
    
    private func gymsFromJsonData(data: Data) -> [Gym] {
        let decoder = JSONDecoder()
        let gyms = try? decoder.decode([Gym].self, from: data)
        
        return gyms ?? [Gym]()
    }
    
    
}
