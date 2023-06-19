import UIKit

class VehicleClass {
    let name: String
    var numberOfWheels: Int
    
    init(name: String, numberOfWheels: Int) {
        self.name = name
        self.numberOfWheels = numberOfWheels
    }
}

struct VehicleStruct {
    let name: String
    var numberOfWheels: Int
}


var vehicleClass: VehicleClass = VehicleClass(name: "Citroen", numberOfWheels: 4)
