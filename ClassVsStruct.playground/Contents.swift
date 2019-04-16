import UIKit

// Class vs Struct
// There are 3 main differences:
// 1. Classes are reference types, Structs are value types
// 2. Class definitions must include init for all non-optional properties
// 3. Classes can inherit, structs can't

class Car {
    var name: String
    var color: String
    var previousOwners: [String]? // Optional property doesn't need to be initialized
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

struct Truck {
    var name: String
    var color: String
    var previousOwners: [String]?
    
    // No initializer required in the source file
}

struct Motorcycle {
    var name: String
    var color: String
    var previousOwners: [String]?
    
    // But we can include an initializer if we want to
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

let myCar = Car(name: "Ford Mustang", color: "Red")
let myTruck = Truck(name: "Dodge Ram", color: "Red", previousOwners: nil) // with no custom init, we must initialize all properties
let myBike = Motorcycle(name: "Ducati Scrambler", color: "Atomic Tangerine")


// Passing by Reference vs passing by Value

let stolenCar = myCar
let stolenBike = myBike
var stolenTruck = myTruck

// stolenCar is a "let" constant, but we can change its properties
stolenCar.color = "Black"
stolenCar.previousOwners = ["Me"]

// stolenBike is a "let" constant, and we cannot alter any of its individual properties

// stolenTruck's properties can only be changed if the struct is a "var" variable
stolenTruck.color = "Black"
stolenTruck.previousOwners = ["Me"]

// Changing these properties updates the original class object passed by reference but not the struct passed as values.
print("My car was stolen and is now a \(myCar.color) \(myCar.name)")
print("But my original truck is still a \(myTruck.color) \(myTruck.name)")

// Classes can inherit from another class to add/expand/customize properties and functions
class Lambo: Car {
    
    func showPriceTag() {
        print("\(self.name) will cost you $200,000+")
    }
}

let myLambo = Lambo(name: "My cool Lambo", color: "Yellow")
myLambo.showPriceTag()

