//MARK: Example 1
class User {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}

protocol Server {
    func grandAccess(user: User)
    
    func denyAccess(user:User)
}

class RealServer: Server {
    func grandAccess(user: User) {
        print("User \(user.id) has access to server...")
    }
    
    func denyAccess(user: User) {
        print("User \(user.id) is denied access to the server...")
    }
}

class ProxyServer: Server {
    lazy var server = RealServer()
    
    func grandAccess(user: User) {
        server.grandAccess(user: user)
    }
    
    func denyAccess(user: User) {
        server.denyAccess(user: user)
    }
}

var user = User(id: 1105)
var realServer = RealServer()
var proxy = ProxyServer()
proxy.server = RealServer()
proxy.grandAccess(user: user)
