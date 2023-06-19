import UIKit

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("Person \(name) is being initialized")
    }
    
    deinit {
        print("Person \(name) is being deinitialized")
    }
}

class Apartment {
    let name: String
    var tenant: Person?
    
    init(name: String) {
        self.name = name
        print("Apartment \(name) is being initialized")
    }
    
    deinit {
        print("Apartment \(name) is being deinitialized")
    }
}

var oscar: Person?
var house: Apartment?

oscar = Person(name: "Óscar")
house = Apartment(name: "casita")

oscar?.apartment = house
house?.tenant = oscar

oscar = nil
house = nil

