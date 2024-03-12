//
//  DatabaseManager.swift
//  DatabaseManager
//
//  Created by 陳韋綸 on 2021/11/12.
//

import Foundation
import Firebase

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let ref = Database.database().reference()
    
    public func userDatabase(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        let data = [
            "username": username,
            "password": password,
            "isSigned": false
        ] as [String : Any]
        let email = email.emailEncoder()
        ref.child("User/\(email)").setValue(data)
        completion(true)
    }
    
}
