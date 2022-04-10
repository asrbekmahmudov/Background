
import Foundation

class Defs: ObservableObject {
    
    private var defaults = UserDefaults.standard
    
    @Published var name: String {
        didSet {
            defaults.set(name, forKey: "name")
        }
    }
    
    @Published var user: User? {
        didSet {
            storeUser(user: user ?? User(email: "no", password: "no"))
        }
    }
    
    init() {
        self.name = defaults.object(forKey: "name") as? String ?? ""
        self.user = loadUser()
    }
    
    func storeUser(user: User) {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            defaults.set(encodedUser, forKey: "user")
        }
    }
    
    func loadUser() -> User! {
        if let savedUserData = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
                return savedUser
            }
        }
        return nil
    }
}
