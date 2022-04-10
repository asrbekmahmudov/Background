import Foundation
import SwiftKeychainWrapper

class Keys: ObservableObject {
    
    private var keychain = KeychainWrapper.standard
    
    @Published var name: String {
        didSet {
            keychain.set(name, forKey: "name")
        }
    }
    
    init() {
        self.name = keychain.object(forKey: "name") as? String ?? "no data"
        self.user = loadUser()
    }
    
    @Published var user: User? {
        didSet {
            storeUser(user: user ?? User(email: "no", password: "no"))
        }
    }
    
    func storeUser(user: User) {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: "user")
        }
    }
    
    func loadUser() -> User! {
        if let savedUserData = UserDefaults.standard.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
                return savedUser
            }
        }
        return nil
    }
}
