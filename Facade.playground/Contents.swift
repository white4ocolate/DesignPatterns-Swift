//MARK: Example 1
final class SweetShop{
    func buySweets() -> String {
        return "sweets"
    }
}

final class MeatShop {
    func buyMeat() -> String {
        return "meats"
    }
}

final class DrinkShop {
    func buyDrinks() -> String {
        return "drinks"
    }
}

final class VegatableShop {
    func buyVegatables() -> String {
        return "vegatables"
    }
}

protocol Facade {
    func buyProducts() -> String
}

class ProductList: Facade {
    
    
    func buyProducts() -> String {
        var products = ""
        
        let sweets = SweetShop()
        let meats = MeatShop()
        let drinks = DrinkShop()
        let vegatables = VegatableShop()
        
        products += sweets.buySweets() + " " + meats.buyMeat() + " " + drinks.buyDrinks() + " " + vegatables.buyVegatables()
        
        return "We bought \(products)"
    }
}

let products = ProductList()
print(products.buyProducts())
