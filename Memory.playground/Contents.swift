import UIKit

class Person {
    let name: String
    var apartment: Apartment?
    
    init (name: String) {
        self.name = name
        print("Person \(name) is being inicialized")
    }
    
    deinit {
        print("Person \(name) is being deinicialized")
    }
}

class Apartment {
    let name: String
    weak var tenant: Person?
    
    init (name: String) {
        self.name = name
        print("Person \(name) is being inicialized")
    }
    
    deinit {
        print("Person \(name) is being deinicialized")
    }
}

var ale: Person?
var house: Apartment?

ale = Person(name: "Alejandro")
house = Apartment(name: "casita")

ale?.apartment = house
house?.tenant = ale

ale = nil
house = nil
