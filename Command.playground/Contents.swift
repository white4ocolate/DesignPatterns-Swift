//MARK: Example 1
class Account {
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}

protocol Command {
    var isCompleted: Bool {get set}
    func execute()
}

class Deposit: Command {
    var isCompleted: Bool = false
    var _account: Account
    var _amount: Int
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        self._account.balance += _amount
        isCompleted = true
    }
}

class Withdrawal: Command {
    var isCompleted: Bool = false
    var _account: Account
    var _amount: Int
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        if self._account.balance >= _amount{
            self._account.balance -= _amount
            isCompleted = true
        } else {
            print("No enough money on balance")
        }
        
    }
}

class TransactionManager {
    static let shared = TransactionManager()
    private var _transactions: [Command] = []
    private init() {}
    
    var pendingTransactions: [Command] {
        get {
            _transactions.filter{$0.isCompleted == false}
        }
    }
    
    func addTransaction(transaction: Command) {
        self._transactions.append(transaction)
    }
    
    func processingTransaction() {
        _transactions.filter{$0.isCompleted == false}.forEach {$0.execute()}
    }
}


let accountJohnDoe = Account(accountName: "John Doe", balance: 10000)
let transactionManager = TransactionManager.shared
transactionManager.addTransaction(transaction: Deposit(account: accountJohnDoe, amount: 2000))
transactionManager.pendingTransactions
accountJohnDoe.balance
transactionManager.processingTransaction()
accountJohnDoe.balance
