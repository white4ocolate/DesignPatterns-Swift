//MARK: Example 1
class Driver {
    var isGoodDriver: Bool
    var name: String
    
    init(isGoodDriver: Bool, name: String) {
        self.isGoodDriver = isGoodDriver
        self.name = name
    }
}

class Car{
    var goodDriverIterator: GoodDriverIterator{
        return GoodDriverIterator(drivers: drivers)
    }
    
    var badDriverIterator: BadDriverIterator{
        return BadDriverIterator.init(drivers: drivers)
    }
    
    private let drivers = [Driver(isGoodDriver: true, name: "Steve"),
                           Driver(isGoodDriver: false, name: "John"),
                           Driver(isGoodDriver: true, name: "Paul"),
                           Driver(isGoodDriver: true, name: "David"),
                           Driver(isGoodDriver: false, name: "Mike")]
}

//extension Car: Sequence {
//    func makeIterator() -> GoodDriverIterator {
//        return GoodDriverIterator(drivers: drivers)
//    }
//}

class GoodDriverIterator: IteratorProtocol {
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter({$0.isGoodDriver})
    }
    
    func next() -> Driver? {
        defer {
            current += 1
        }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
}

class BadDriverIterator: IteratorProtocol {
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter({!$0.isGoodDriver})
    }
    
    func next() -> Driver? {
        defer {
            current += 1
        }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
    
}

let car = Car()
let goodDriver = car.goodDriverIterator.next()

let badDriver = car.badDriverIterator.next()

//let goodDriverSequence = car.makeIterator().allDrivers()
