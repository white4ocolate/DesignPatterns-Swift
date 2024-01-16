//MARK: Example 1
protocol Car {
    func drive()
}

class LittleSizeCar: Car {
    func drive() {
        print("You drive a little size car")
    }
}
class MiddleSizeCar: Car {
    func drive() {
        print("You drive a middle size car")
    }
}

protocol Bus {
    func drive()
}

class LittleSizeBus: Bus {
    func drive() {
        print("You drive a little size bus")
    }
}
class MiddleSizeBus: Bus {
    func drive() {
        print("You drive a middle size bus")
    }
}

protocol Factory {
    func produceCar() -> Car
    func produceBus() -> Bus
}

class LittleSizeFactory: Factory {
    func produceCar() -> Car {
        print("Create a little size car.")
        return LittleSizeCar()
    }
    
    func produceBus() -> Bus {
        print("Create a little size bus.")
        return LittleSizeBus()
    }
}

class MiddleSizeFactory: Factory {
    func produceCar() -> Car {
        print("Create a middle size car.")
        return MiddleSizeCar()
    }
    
    func produceBus() -> Bus {
        print("Create a middle size bus.")
        return MiddleSizeBus()
    }
}

let littleFactory = LittleSizeFactory()
let littleCar = littleFactory.produceCar()
littleCar.drive()
