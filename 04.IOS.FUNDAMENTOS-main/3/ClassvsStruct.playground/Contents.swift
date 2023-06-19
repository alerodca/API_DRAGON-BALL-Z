import UIKit

class VehicleClass {
    let name: String
    var numberOfWheels: Int
    
    // init is mandatory
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
let vehicleClassCopy = vehicleClass

vehicleClassCopy.numberOfWheels = 8
print(vehicleClass.numberOfWheels)

var vehicleStruct: VehicleStruct = VehicleStruct(name: "Ford", numberOfWheels: 12)
var vehicleStructCopy = vehicleStruct

vehicleStructCopy.numberOfWheels = 0
print(vehicleStruct.numberOfWheels)
