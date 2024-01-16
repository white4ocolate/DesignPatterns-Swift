import UIKit

//MARK: Example 1
protocol Vehicle {
    func drive()
}

class Car: Vehicle {
    func drive() {
        print("You drive a car")
    }
}

class Truck: Vehicle {
    func drive() {
        print("You drive a truck")
    }
}

class Bus: Vehicle {
    func drive() {
        print("You drive a bus")
    }
}

protocol VehicleFactory {
    func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Car was created")
        return Car()
    }
}

class TruckFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Truck was created")
        return Truck()
    }
}

class BusFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Bus was created")
        return Bus()
    }
}

let truckFactory = TruckFactory()
let truck = truckFactory.produce()
truck.drive()
