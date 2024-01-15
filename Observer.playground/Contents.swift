import UIKit

//MARK: Example 1
protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String)
}

class Teacher: Subject {
    var observerSCollection = NSMutableSet()
    
    var homeTask = "" {
        didSet {
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerSCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerSCollection.remove(observer)
    }
    
    func notify(withString notification: String) {
        for observer in observerSCollection {
            (observer as! PropertyObserver).didGet(newTask: notification)
        }
    }
}

protocol PropertyObserver {
    func didGet(newTask task: String)
}

class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("new homework be done")
    }
}

var teacher = Teacher()
var pupil = Pupil()
var student = Pupil()

teacher.add(observer: pupil)
teacher.add(observer: student)
teacher.homeTask = "параграф №3"
pupil.homeTask
student.homeTask


//MARK: Example 2
protocol Observable {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notifyObservers()
}

protocol Observer {
    var id: String {get set}
    func update(value: Int?)
}

final class NewsResource: Observable {
    var value: Int? {
        didSet {
            notifyObservers()
        }
    }
    private var observers: [Observer] = []
    
    func add(observer: Observer) {
        observers.append(observer)
    }
    
    func remove(observer: Observer) {
        guard let index = observers.enumerated().first(where: { $0.element.id == observer.id })?.offset else { return }
        observers.remove(at: index)
    }
    
    func notifyObservers() {
        observers.forEach({$0.update(value: value)})
    }
}
final class NewsAgency: Observer {
    var id = "NewsAgency"
    
    func update(value: Int?) {
        guard let value = value else { return }
        print("NewsAgency handle updated value: \(value)")
    }
}
final class Reporter: Observer {
    var id = "Reporter"
    
    func update(value: Int?) {
        guard let value = value else { return }
        print("Reporter. Updated value: \(value)")
    }
}
final class Blogger: Observer {
    var id = "Blogger"
    
    func update(value: Int?) {
        guard let value = value else { return }
        print("Blogger. New article about value: \(value)")
    }
}

var resource = NewsResource()
var newsAgency = NewsAgency()
var blogger = Blogger()
var reporter = Reporter()

resource.add(observer: blogger)
resource.add(observer: reporter)
resource.value = 10


//MARK: Example 3
//protocol PropertyObserver {
//    
//    func getMyProduct(myProduct: String)
//    
//}
//
//protocol Product {
//    
//    func addToList(observer: PropertyObserver)
//    
//    func removeFromList(observer: PropertyObserver)
//    
//    func notify(withProduct product: String)
//}
//
//class Shop: Product {
//    var customerList = NSMutableSet()
//    
//    var product = "" {
//        didSet {
//            notify(withProduct: product)
//        }
//    }
//    
//    func addToList(observer: PropertyObserver) {
//        customerList.add(observer)
//    }
//    
//    func removeFromList(observer: PropertyObserver) {
//        customerList.remove(observer)
//    }
//    
//    func notify(withProduct product: String) {
//        for customer in customerList {
//            (customer as! PropertyObserver).getMyProduct(myProduct: product)
//        }
//    }
//}
//
//class Customer: NSObject, PropertyObserver {
//    
//    var myProduct = ""
//    
//    func getMyProduct(myProduct: String) {
//        self.myProduct = myProduct
//    }
//    
//}
//
//
//var shop = Shop()
//var customer = Customer()
//
//shop.addToList(observer: customer)
//
//shop.product = "Microwave"
//print(customer.myProduct)
