//
//  MoodStorage.swift
//  Mood(Demo)
//
//  Created by Zain on 2024-03-15.
//

import Foundation

struct Constants {
    
    static let keyUserToke = "userToken"
}


struct MoodStorage {
    
    
    static var token: String? {
        get {
            UserDefaults.standard.string(forKey: Constants.keyUserToke)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.keyUserToke)
        }
    }
    
    
}
