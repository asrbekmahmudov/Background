
import Foundation
import Combine
import Firebase

class SessionStore: ObservableObject {
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: UserInfo? { didSet {self.didChange.send(self)} }
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener { (auth, userInfo) in
            if let userInfo = userInfo {
                print("Got user \(userInfo)")
                self.session = UserInfo(uid: userInfo.uid, email: userInfo.email, displayName: userInfo.displayName)
            } else {
                self.session = nil
            }
        }
    }
    
    // additional methods (sign in, sign up) will go here
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut() -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
}
