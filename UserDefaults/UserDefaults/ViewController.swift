//
//  ViewController.swift
//  UserDefaults
//
//  Created by Alejandro Rodríguez Cañete on 9/6/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let defaults = UserDefaults.standard
        
        // Writting data in UserDefaults
        
        // Int
        defaults.set(22, forKey: "bday")
        
        //vBool
        defaults.set(true, forKey: "darkMode")
        
        //vString Array
        let fruits = ["apple","banana","mango"]
        defaults.set(fruits, forKey: "fruits")
        
        // Dictionary
        let dic = ["wifi": true, "bluetooth":false, "phone":true,]
        defaults.set(dic, forKey: "dictionary")
        
        // Reading data from UserDefaults
        
        // Int
        let saveBday = defaults.integer(forKey: "bday")
        
        // Bool
        let saveDarkMode = defaults.bool(forKey: "darkMode")
        
        // String Array
        let savedFruits = defaults.array(forKey: "fruits") ?? []
        
        // Dic
        let savedDic = defaults.dictionary(forKey: "dictionary") ?? [:]
        
        // Object
        let fruitsObject = defaults.object(forKey: "fruits") as? [String] ?? []
        
        
        // Storing csutom objects in UserDefaults
        
        let user = User(name: "Alejandro", age: 18)
        
        if let encodeUser = try? JSONEncoder().encode(user) {
            defaults.set(encodeUser, forKey: "user")
        }
        
        // Reading custom object from UserDefaults
        
        if let savedUserData = defaults.object(forKey: "user") as? Data {
            
            if let savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
                print("Saved User: \(savedUser)")
            }
        }
        
        Defaults.shared.saveEmail("Ale.rodca04@gmail.com")
        
        let email = Defaults.shared.getEmail() ?? ""
        print(email)
        
    }


}

struct User: Codable {
    let name: String
    let age: Int
}
