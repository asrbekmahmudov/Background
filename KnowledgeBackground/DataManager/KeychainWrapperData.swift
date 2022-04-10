
import Foundation
import SwiftKeychainWrapper

struct KeychainWrapperData {
    static let keychain = KeychainWrapper.standard
    
    // Name user
    static func storeName(name: String) {
        keychain.set(name, forKey: "name")
    }
    
    static func loadName() -> String {
        return keychain.object(forKey: "name") as? String ?? "no data yet"
    }
    
    // Store Object using Custom Class
    static func storeUser(user: User) {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            keychain.set(encodedUser, forKey: "user")
        }
    }
    
    static func loadUser() -> User! {
        if let savedUserData = UserDefaults.standard.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
                return savedUser
            }
        }
        return nil
    }
}
