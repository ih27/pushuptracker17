//
//  ViewController.swift
//  pushuptracker17
//
//  Created by Ismayil Hasanov on 10/16/17.
//  Copyright © 2017 GWU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pushUpRecord: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load")
        
        // pushUpRecord.text = "Pushup Record: 50"
    }
    
    
    @IBAction func trackButtonPressed(_ sender: Any) {
        print("track pushup pressed")
        
        performSegue(withIdentifier: "pushUpSegue", sender: self)
    }
}
