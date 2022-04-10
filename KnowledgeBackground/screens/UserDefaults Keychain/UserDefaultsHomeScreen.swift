//
//  UserDefaultsHomeScreen.swift
//  KnowledgeBackground
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 30/08/21.
//

import SwiftUI

struct UserDefaultsHomeScreen: View {
    
    @State var text = "NoData"
    @ObservedObject var defs = Defs()
    @ObservedObject var keys = Keys()
    
    init() {
        //userDefaultsInit()
        keychainWrapperInit()
    }
    
    func userDefaultsInit() {
        // MARK: UserDefaults
        let defaults = UserDefaults.standard
        
        let data1 = defaults.string(forKey: "data")
        print(data1 as Any)
        
        defaults.setValue("PDP Online", forKey: "data")
        
        let data2 = defaults.string(forKey: "data")
        print(data1 as Any, data2 as Any)
        
        // Integer, String, Boolean, Array, Dictionary
        defaults.set(10, forKey: "userAge")
        print(defaults.integer(forKey: "userAge"))
        
        defaults.set(true, forKey: "darkModeEnabled")
        print(defaults.bool(forKey: "userAge"))
        
        defaults.set(["Apple", "Banana", "Mango"], forKey: "favoriteFruits")
        print(defaults.array(forKey: "favoriteFruits") as Any)
        
        defaults.set(["WiFi": true, "Bluetooth": false, "Cellular": true], forKey: "toggleStates")
        print(defaults.dictionary(forKey: "toggleStates") as Any)
        
        // Store String using Custom Class
        print(Defaults.loadName())
        Defaults.storeName(name: "PDP Online")
        print(Defaults.loadName())
        
        // Custom Object in UserDefaults
        print(Defaults.loadUser() as Any)
        let user = User(email: "test@gmail.com", password: "123qwe")
        Defaults.storeUser(user: user)
        print(Defaults.loadUser() as Any)
        // print(Defaults.loadUser() as User)
        
        // Store String using Observed Class
        print(defs.name)
        defs.name = "PDP Online"
        print(defs.name)
        defs.name.removeAll()
        print(defs.name)
        
        // Store Object using Observed Class
        print(defs.loadUser() as Any)
        let userWithObservedClass = User(email: "test@gmail.com", password: "123qwe")
        defs.user = userWithObservedClass
        print(defs.loadUser() as Any)
    }
    
    func keychainWrapperInit() {
        // MARK: Keychain
        /// UserDefaults  –> KeychainWrapper
//        let keychain = KeychainWrapper.standard
//
//        let data_1 = keychain.string(forKey: "data")
//        print(data_1 as Any)
//
//        keychain.set("PDP Online", forKey: "data")
//
//        let data_2 = keychain.string(forKey: "data")
//        print(data_1 as Any, data_2 as Any)
//
//        // Integer, String, Boolean, Array, Dictionary
//        keychain.set(10, forKey: "userAge")
//        print(keychain.integer(forKey: "userAge") as Any)
//
//        keychain.set(true, forKey: "darkModeEnabled")
//        print(keychain.bool(forKey: "userAge") as Any)
        
        // Store String using Custom Class
        print("1",KeychainWrapperData.loadName())
        KeychainWrapperData.storeName(name: "PDP Online")
        print("1",KeychainWrapperData.loadName())
        
        // Custom Object in KeychainWrapper
        print("2",KeychainWrapperData.loadUser() as Any)
        let user = User(email: "test@gmail.com", password: "123qwe")
        KeychainWrapperData.storeUser(user: user)
        print("2",KeychainWrapperData.loadUser() as Any)
        // print(KeychainWrapperData.loadUser() as User)
        
        // Store String using Observed Class
        print("3",keys.name)
        keys.name = "PDP Online"
        print("3",keys.name)
        
        // Store Object using Observed Class
        print("4",keys.loadUser() as Any)
        keys.user = User(email: "test@gmail.com", password: "123qwe")
        print("4",keys.loadUser() as Any)
    }
    
    var body: some View {
        Text(defs.loadUser().email).padding()
        Text(keys.loadUser().email).padding()
    }
}

struct UserDefaultsHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsHomeScreen()
    }
}
