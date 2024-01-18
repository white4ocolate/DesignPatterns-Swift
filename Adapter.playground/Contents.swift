//MARK: Example 1

protocol BMRImperialCalculation {
    func bmr(height: Double, weight: Double, age: Int) -> Int
}

struct BMRCalculator: BMRImperialCalculation {
    func bmr(height: Double, weight: Double, age: Int) -> Int {
        return Int(66 + (6.2 * weight) + (12.7 * height) - (6.76 * Double(age)))
    }
}

protocol BMRMetricalCalculation {
    func metricBMR(height: Double, weight: Double, age: Int) -> String
}

struct BMRCalculatorAdapter: BMRMetricalCalculation {
    private var adaptee: BMRImperialCalculation
    
    init(adaptee: BMRImperialCalculation) {
        self.adaptee = adaptee
    }
    
    func metricBMR(height: Double, weight: Double, age: Int) -> String {
        let iHeight = height * 3.28
        let iWeight = weight * 2.20
        let result = adaptee.bmr(height: iHeight, weight: iWeight, age: age)
        
        return "BMR is \(result)"
    }
}

struct Person {
    func checkBMR(calculator: BMRMetricalCalculation) {
        print(calculator.metricBMR(height: 1.8, weight: 80, age: 31))
    }
}

let person = Person()

person.checkBMR(calculator: BMRCalculatorAdapter(adaptee: BMRCalculator()))


//MARK: Example 2
// adaptee
class SimpleCar {
    func sound() -> String{
        return "tr-tr-tr-tr-tr"
    }
}
// target
protocol SuperCarProtocol {
    func makeNoise() -> String
}

class Supercar: SuperCarProtocol {
    func makeNoise() -> String {
        return "wroom-wroom"
    }
}

class SuperCarAdapter: SuperCarProtocol {
    private var adaptee: SimpleCar
    
    init(adaptee: SimpleCar) {
        self.adaptee = adaptee
    }
    
    func makeNoise() -> String {
        return adaptee.sound()
    }
}
