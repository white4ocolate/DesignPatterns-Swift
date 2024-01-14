import UIKit

//MARK: Example 1
protocol SwimBeahavior {
    func swim()
}

class ProfessionalSwimmer: SwimBeahavior {
    func swim() {
        print("professional swimmer")
    }
}

class NonSwimmer: SwimBeahavior {
    func swim() {
        print("Non swimming")
    }
}

protocol DiveBehavior {
    func dive()
}

class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("professional diving")
    }
}

class NonDiver: DiveBehavior {
    func dive() {
        print("non-diving")
    }
}

class NewbiewDiver: DiveBehavior {
    func dive() {
        print("newbie diving")
    }
}

class Human {
    private var diveBehavior: DiveBehavior!
    private var swimBehavior: SwimBeahavior!
    
    init(diveBehavior: DiveBehavior!, swimBehavior: SwimBeahavior!) {
        self.diveBehavior = diveBehavior
        self.swimBehavior = swimBehavior
    }
    
    func performSwim() {
        swimBehavior.swim()
    }
    
    func performDive() {
        diveBehavior.dive()
    }
    
    func setSwimBehavior(swimBehavior: SwimBeahavior) {
        self.swimBehavior = swimBehavior
    }
    
    func setDiveBehavior(diveBehavior: DiveBehavior){
        self.diveBehavior = diveBehavior
    }
    
    func run() {
        print("running")
    }
}

let human = Human(diveBehavior: NewbiewDiver(),swimBehavior: ProfessionalSwimmer())
human.performDive()
human.performSwim()



//MARK: Example 2
protocol FilterStartegy {
    
    func process(image: UIImage) -> UIImage
    
}

class Filter {
    var filterStrategy : FilterStartegy
    
    init(filterStrategy: FilterStartegy) {
        self.filterStrategy = filterStrategy
    }
    
    func applyFilter(to image: UIImage) -> UIImage {
        return filterStrategy.process(image: image)
    }
}

class SepiaFilter: FilterStartegy {
    func process(image: UIImage) -> UIImage {
        print("Sepia filter was added to image")
        return image
    }
}

class BlackWhiteFilter: FilterStartegy {
    func process(image: UIImage) -> UIImage {
        print("Black & White filter was added to image")
        return image
    }
}

class CameraRollFilter: FilterStartegy {
    func process(image: UIImage) -> UIImage {
        print("CameraRoll filter was added to image")
        return image
    }
}

var filter = Filter(filterStrategy: SepiaFilter())
var image = UIImage()

//filter.applyFilter(to: image)
filter.filterStrategy = BlackWhiteFilter()
filter.applyFilter(to: image)



//MARK: Example 3
protocol CircleBehavior {
    func area()
    
    func perimeter()
}

protocol SquareBehavior {
    func area()
    
    func perimeter()
}

class Circle: CircleBehavior {
    func area(){
        print("S = pi * r * r")
    }
    
    func perimeter() {
        print("P = 2 * pi * r")
    }
}

class Square: SquareBehavior {
    func area() {
        print("S = a * a")
    }
    
    func perimeter() {
        print("P = a * 4")
    }
}
class CalculateGeometry {
    var circleBehavior: CircleBehavior
    
    var squareBehavior: SquareBehavior
    
    init(circleBehavior: CircleBehavior, squareBehavior: SquareBehavior) {
        self.circleBehavior = circleBehavior
        self.squareBehavior = squareBehavior
    }
    
    func performCircle(){
        circleBehavior.area()
        circleBehavior.perimeter()
    }
    
    func performSquare(){
        squareBehavior.area()
        squareBehavior.perimeter()
    }
}
var calculator = CalculateGeometry(circleBehavior: Circle(), squareBehavior: Square())
calculator.performCircle()



