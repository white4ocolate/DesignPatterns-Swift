//MARK: Example 1
//class User {
//    var id: Int
//    
//    init(id: Int) {
//        self.id = id
//    }
//}
//
//protocol Server {
//    func grandAccess(user: User)
//    
//    func denyAccess(user:User)
//}
//
//class RealServer: Server {
//    func grandAccess(user: User) {
//        print("User \(user.id) has access to server...")
//    }
//    
//    func denyAccess(user: User) {
//        print("User \(user.id) is denied access to the server...")
//    }
//}
//
//class ProxyServer: Server {
//    lazy var server = RealServer()
//    
//    func grandAccess(user: User) {
//        server.grandAccess(user: user)
//    }
//    
//    func denyAccess(user: User) {
//        server.denyAccess(user: user)
//    }
//}
//
//var user = User(id: 1105)
//var proxy = ProxyServer()
//proxy.grandAccess(user: user)


//MARK: Example 2
class User {
    var login = "admin"
    var password = "qwerty1234"
    
}

protocol Serverprotocol {
    func grandAccess(user: User)
}

class Server: Serverprotocol {
    func grandAccess(user: User) {
        print("User \(user.login) has access to server...")
    }
}

class Proxy: Serverprotocol {
    var server: Server!
    
    var login: String = "admin"
    var password: String = "qwerty1234"
    
    func grandAccess(user: User) {
        guard server != nil else {
            print("Access is Denied!")
            return
        }
        server.grandAccess(user: user)
    }
    
    func authenticate(user: User) {
        guard user.login == self.login && user.password == self.password else { return }
        print("Access is allowed...")
        server = Server()
    }
    
}

let user = User()
let proxy = Proxy()

proxy.authenticate(user: user)
proxy.grandAccess(user: user)
