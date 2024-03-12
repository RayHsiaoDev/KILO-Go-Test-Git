//
//  AuthManager.swift
//  AuthManager
//
//  Created by 陳韋綸 on 2021/11/12.
//

import Foundation
import Firebase

class AuthManager {
    static let shared = AuthManager()
    
    public var isLogging: Bool {
        return Auth.auth().currentUser != nil
    }
    
    public func createAcount(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                print(error)
                completion(false)
                return
            }
            
            DatabaseManager.shared.userDatabase(username: username, email: email, password: password) { success in
                if success {
                    print("創建資料庫成功")
                    completion(true)
                }
                else {
                    print("創建資料庫失敗")
                    completion(false)
                }
            }
        }
    }
    
    public func isFirstSignIn(email: String, completion: @escaping (Bool) -> Void) {
        let email = email.emailEncoder()
        Database.database().reference().child("User/\(email)/isSigned").observeSingleEvent(of: .value) { snapshot in
            guard let bool = snapshot.value as? Bool else {
                return
            }
            if bool {
                completion(true)
                print("登入過了")
                UserDefaults.standard.setValue(email, forKey: "email")
            }
            else {
                completion(false)
                print("沒登入過")
                UserDefaults.standard.setValue(email, forKey: "email")
            }
        }
    }
    
    public func signInAcount(
        email: String,
        password: String,
        completion: @escaping (Bool) -> Void
    ) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            guard error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
}
