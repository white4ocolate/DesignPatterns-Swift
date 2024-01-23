//MARK: Example 1
protocol Employee {
    var level: Int { get }
    
    func hire(employee: Employee)
    func getInfo()
}

class HighLevelEmployee: Employee {
    var employees = [Employee]()
    var level: Int
    
    init(level: Int) {
        self.level = level
    }
    
    func hire(employee: Employee) {
        self.employees.append(employee)
    }
    
    func getInfo() {
        print(self.level.description + " level employee")
        for employee in employees {
            employee.getInfo()
        }
    }
}

class LowLevelEmployee: Employee {
    var level: Int
    
    init(level: Int) {
        self.level = level
    }
    
    func hire(employee: Employee) {
        print("can't hire employees")
    }
    
    func getInfo() {
        print(self.level.description + " level employee")
    }
}

var CEO = HighLevelEmployee(level: 1)
var CTO = HighLevelEmployee(level: 2)

var TeamLeadDev = HighLevelEmployee(level: 3)
var TeamLeadQA = HighLevelEmployee(level: 3)

var developer1 = LowLevelEmployee(level: 4)
var developer2 = LowLevelEmployee(level: 4)
var qa1 = LowLevelEmployee(level: 4)
var qa2 = LowLevelEmployee(level: 4)

CEO.hire(employee: CTO)

CTO.hire(employee: TeamLeadDev)
CTO.hire(employee: TeamLeadQA)

TeamLeadDev.hire(employee: developer1)
TeamLeadDev.hire(employee: developer2)

TeamLeadQA.hire(employee: qa1)
TeamLeadQA.hire(employee: qa2)

CEO.getInfo()
