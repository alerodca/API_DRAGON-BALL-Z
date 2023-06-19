//
//  Defaults.swift
//  UserDefaults
//
//  Created by Alejandro Rodríguez Cañete on 9/6/23.
//

import Foundation

final class Defaults {
    
    static let shared = Defaults()
    
    private static let email = "email"
    
    func saveEmail(_ email: String) {
        UserDefaults.standard.set(email, forKey: Self.email)
    }
    
    func getEmail() -> String? {
        UserDefaults.standard.string(forKey: Self.email)
    }
}
