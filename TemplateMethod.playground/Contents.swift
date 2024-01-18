//Example 1
protocol DriveVehicle {
    func startVehicle()
    
    func sitAtVehicle()
    
    func protectYourSelf()
    
    func signalForMovement()
    
    func driveForward()
}

extension DriveVehicle {
    func startVehicle() {
        sitAtVehicle()
        protectYourSelf()
        signalForMovement()
        driveForward()
    }
    
    func sitAtVehicle() {
        preconditionFailure("shoud override")
    }
    
    func protectYourSelf() {
        preconditionFailure("shoud override")
    }
    
    func signalForMovement() {
        preconditionFailure("shoud override")
    }
    
    func driveForward() {
        preconditionFailure("shoud override")
    }
}

class Bycicle: DriveVehicle{
    
    func sitAtVehicle() {
        print("get on a bycicle")
    }
    
    func protectYourSelf() {
        print("wear a bycicle helmet")
    }
    
    func signalForMovement() {
        print("raise your left hand")
    }
    
    func driveForward() {
        print("start pedaling")
    }
}

class Car: DriveVehicle {
    func sitAtVehicle() {
        print("get in a car")
    }
    
    func protectYourSelf() {
        print("fasten your seat belt")
    }
    
    func signalForMovement() {
        print("turn on the left turn signal")
    }
    
    func driveForward() {
        print("press the pedal")
    }
}
let bycicle = Bycicle()
bycicle.startVehicle()
print("--------------------------")
let car = Car()
car.startVehicle()
