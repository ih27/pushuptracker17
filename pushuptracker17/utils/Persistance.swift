//
//  Persistance.swift
//  pushuptracker17
//
//  Created by Ismayil Hasanov on 10/30/17.
//  Copyright © 2017 GWU. All rights reserved.
//

import Foundation

class Persistance {
    let workoutsKey = "workouts"
    
    func fetchWorkouts() -> [Workout] {
        let userDefaults = UserDefaults.standard
        
        let data = userDefaults.object(forKey: workoutsKey) as? Data
        if let data = data {
            // data is not nil
            return NSKeyedUnarchiver.unarchiveObject(with: data) as? [Workout] ?? [Workout]()
        } else {
            // data is nil
            return [Workout]()
        }
    }
    
    func saveWorkout(_ workout: Workout) {
        let userDefaults = UserDefaults.standard
        
        var workouts = fetchWorkouts()
        workouts.append(workout)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: workouts)
        userDefaults.set(data, forKey: workoutsKey)
    }
}
