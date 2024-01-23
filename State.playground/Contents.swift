//MARK: Example 1
protocol State {
    func on(printer: Printer)
    
    func off(printer: Printer)
    
    func printDocument(printer: Printer)
}

class On: State {
    func on(printer: Printer) {
        print("the printer is allready turned on...")
    }
    
    func off(printer: Printer) {
        printer.set(state: Off())
        print("the printer is turned off...")
    }
    
    func printDocument(printer: Printer) {
        printer.set(state: Print())
        print("the printer is printing...")
    }
}

class Off: State {
    func on(printer: Printer) {
        printer.set(state: On())
        print("the printer turned on...")
    }
    
    func off(printer: Printer) {
        print("the printer is turned off allready...")
    }
    
    func printDocument(printer: Printer) {
        print("printer is off! please turn on the printer!")
    }
}

class Print: State {
    func on(printer: Printer) {
        printer.set(state: On())
        print("the printer is allready turned on...")
    }
    
    func off(printer: Printer) {
        printer.set(state: Off())
        print("the printer is turned off...")
    }
    
    func printDocument(printer: Printer) {
        print("the printer is already printing...")
    }
}

class Printer {
    var state: State
    
    init() {
        self.state = On()
    }
    
    func set(state: State) {
        self.state = state
    }
    
    func printDocument() {
        state.printDocument(printer: self)
    }
    
    func turnOff() {
        state.off(printer: self)
    }
    
    func turnOn() {
        state.on(printer: self)
    }
}

var printer = Printer()

printer.printDocument()
printer.turnOff()
printer.printDocument()
printer.turnOn()
printer.printDocument()

