//
//  LocalDataLayer.swift
//  Proyecto
//
//  Created by Alejandro Rodríguez Cañete on 9/6/23.
//

import Foundation

final class LocalDataLayer {
    
    private static let token = "token"
    
    static let shared =  LocalDataLayer()
    
    func save(token: String) {
        UserDefaults.standard.set(token, forKey: LocalDataLayer.token)
    }
    
    func getToken() -> String {
        UserDefaults.standard.string(forKey: LocalDataLayer.token) ?? ""
    }
    
    func isUserLogged() -> Bool {
        return !getToken().isEmpty
    }
}
