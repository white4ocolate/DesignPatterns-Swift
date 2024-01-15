//MARK: example 1

protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

class Boxster: Porsche {
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxster"
    }
}

class DecoratorPorsche: Porsche {
    private var decoratedPorshce: Porsche
    
    required init(dp: Porsche) {
        self.decoratedPorshce = dp
    }
    
    func getPrice() -> Double {
        return decoratedPorshce.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorshce.getDescription()
    }
    
}

class PremiumAudioSystem: DecoratorPorsche {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", with premium audio system"
    }
}

class PanoramicSunRoof: DecoratorPorsche {
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 25
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", with panoramic sunroof"
    }
    
}

var porscheBoxcster: Porsche = Boxster()
var dp = DecoratorPorsche(dp: porscheBoxcster)
porscheBoxcster.getDescription()
porscheBoxcster.getPrice()

porscheBoxcster = PremiumAudioSystem(dp: porscheBoxcster)
porscheBoxcster.getDescription()
porscheBoxcster.getPrice()

porscheBoxcster = PanoramicSunRoof(dp: porscheBoxcster)
porscheBoxcster.getDescription()
porscheBoxcster.getPrice()





//MARK: example 2

protocol Coffee {
    func getPrice() -> Double
    
    func getIngredients() -> String
}

final class Espresso: Coffee {
    func getPrice() -> Double {
        return 10
    }
    
    func getIngredients() -> String {
        return "Espresso"
    }
    
}

class CoffeeDecorator: Coffee {
    private var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func getPrice() -> Double {
        return coffee.getPrice()
    }
    
    func getIngredients() -> String {
        return coffee.getIngredients()
    }
}

class Milk: CoffeeDecorator {
    
    override func getPrice() -> Double {
        return super.getPrice() + 10
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + ", with milk"
    }
}

class IceCream: CoffeeDecorator {
    
    override func getPrice() -> Double {
        super.getPrice() + 20
    }
    
    override func getIngredients() -> String {
        super.getIngredients() + ", with IceCream"
    }
}

class Watter: CoffeeDecorator {
    
    override func getPrice() -> Double {
        super.getPrice() + 5
    }
    
    override func getIngredients() -> String {
        super.getIngredients() + ", with watter"
    }
}

var espresso: Coffee = Espresso()
espresso.getIngredients()
espresso.getPrice()

var coffeeDecorator = CoffeeDecorator(coffee: espresso)

//espresso = Watter(coffee: espresso)
//espresso.getIngredients()
//espresso.getPrice()
//
//espresso = Milk(coffee: espresso)
//espresso.getIngredients()
//espresso.getPrice()

var americano = Watter(coffee: espresso)
americano.getIngredients()
americano.getPrice()

var americanoWithMilk = Milk(coffee: Watter(coffee: espresso))
americanoWithMilk.getIngredients()
americanoWithMilk.getPrice()
