//MARK: Example 1
class Enemy {
    var strangth = 400
}

protocol MilitaryChain {
    var strength: Int { get }
    var nextRank: MilitaryChain? { get set }
    
    func shoudDefeat(withStrenght amount: Int)
}

class Soldier: MilitaryChain {
    var strength: Int = 100
    var nextRank: MilitaryChain?
    
    func shoudDefeat(withStrenght amount: Int) {
        if strength > amount {
            print("Soldier got it!")
        } else {
            nextRank?.shoudDefeat(withStrenght: amount)
        }
    }
}

class Officer: MilitaryChain {
    var strength: Int = 300
    var nextRank: MilitaryChain?
    
    func shoudDefeat(withStrenght amount: Int) {
        if strength > amount {
            print("Officer got it!")
        } else {
            nextRank?.shoudDefeat(withStrenght: amount)
        }
    }
}

class General: MilitaryChain {
    var strength: Int = 600
    var nextRank: MilitaryChain?
    
    func shoudDefeat(withStrenght amount: Int) {
        if strength > amount {
            print("General got it!")
        } else {
            print("We can't defeat this enemy!")
        }
    }
}


let enemy = Enemy()

let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextRank = officer
officer.nextRank = general
soldier.shoudDefeat(withStrenght: enemy.strangth)
