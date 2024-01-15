//MARK: Example 1
enum CarType {
    case truckCar
    case sportCar
}

class CarFactory {
    static func produceCar(type: CarType) -> Car {
        var car: Car
        switch type {
        case .sportCar:
            car = SportCar()
            print("This is sport car")
        case .truckCar:
            car = TruckCar()
            print("This is truck car")
        }
        return car
    }
}

protocol Car {
    func drive()
}

class TruckCar: Car {
    func drive() {
        print("You drive a truck car")
    }
}

class SportCar: Car {
    func drive() {
        print("You drive a sport car")
    }
}
var sportCar = CarFactory.produceCar(type: .sportCar)
sportCar.drive()

var truck = CarFactory.produceCar(type: .truckCar)



