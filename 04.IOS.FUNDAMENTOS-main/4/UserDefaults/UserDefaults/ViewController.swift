//
//  ViewController.swift
//  UserDefaults
//
//  Created by Oscar Rodriguez Garrucho on 15/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        // Writing data in UserDefaults
        
        // Int
        defaults.set(24, forKey: "bday")
        
        // Bool
        defaults.set(false, forKey: "darkMode")
        
        // String array
        let fruits = ["apple", "banana", "mango"]
        defaults.set(fruits, forKey: "fruits")
        
        // Dictionary
        let dic = ["wifi": true, "bluetooth": false, "phone": true]
        defaults.set(dic, forKey: "dictionary")
        
        // Reading data from UserDefaults
        
        // Int
        let savedBday = defaults.integer(forKey: "bday")
        print("DEBUG: Int, ", savedBday)
        
        // Bool
        let savedDarkMode = defaults.bool(forKey: "darkMode")
        print("DEBUG: Bool, ", savedDarkMode)
        
        // String array
        let savedFruits = defaults.array(forKey: "fruits") ?? []
        print("DEBUG: String array, ", savedFruits)
        
        // Dictionary
        let savedDict = defaults.dictionary(forKey: "dictionary") ?? [:]
        print("DEBUG: Dictionary, ", savedDict)
        
        // Object
        let fruitsObject = defaults.object(forKey: "fruits") as? [String] ?? []
        print("DEBUG: Object, ", fruitsObject)
        
        
        
        
        
        
        
        // Storing custom objects in UserDefaults
        
        let user = User(name: "Óscar", age: 41)
        
        if let encodedUser = try? JSONEncoder().encode(user) {
            defaults.set(encodedUser, forKey: "user")
        }
        
        // Reading custom objects from UserDefatuls
        
        if let savedUserData = defaults.object(forKey: "user") as? Data {
            
            if let savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
                print("Saved User: ", savedUser)
            }
        }
        
        
        Defaults.shared.saveEmail("manuel@gmail.com")
        
        let email = Defaults.shared.getEmail() ?? ""
        print(email)
        
        
    }


}


struct User: Codable {
    let name: String
    let age: Int
}

