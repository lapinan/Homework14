//
//  UserDefaults.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 15.01.2021.
//

import Foundation

class Persistance {
    
    static let shared = Persistance()
    
    enum keyUserDefautls: String {
        case name, secondName, currentTemp
    }
    
    var name: String {
        set {
            let key = keyUserDefautls.name.rawValue
            UserDefaults.standard.set(newValue, forKey: key)
        }
        get {
            if let name = UserDefaults.standard.string(forKey: keyUserDefautls.name.rawValue) {
                return name
            }
            return ""
        }
    }
    
    var secondName: String {
        set {
            let key = keyUserDefautls.secondName.rawValue
            UserDefaults.standard.set(newValue, forKey: key)
        }
        get {
            if let secondName = UserDefaults.standard.string(forKey: keyUserDefautls.secondName.rawValue) {
                return secondName
            }
            return "" 
        }
    }
    var currentTemp: String {
        set {
            let key = keyUserDefautls.secondName.rawValue
            UserDefaults.standard.set(newValue, forKey: key)
        }
        get {
            if let temp = UserDefaults.standard.string(forKey: keyUserDefautls.currentTemp.rawValue) {
                return temp
            }
            return ""
        }
    }
    
}
