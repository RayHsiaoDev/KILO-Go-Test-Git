//
//  RealtimeDatabaseManager.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/2/21.
//

import Foundation
import Firebase

class RealtimeDatabaseManager {
    
    static let shared = RealtimeDatabaseManager()
    private init() {}
    let ref = Database.database().reference().child("User")
    
    func createUserDataBase(email: String, password: String, userName: String) {
        let email = email.emailEncoder()
        
        let post: [String: Any] = [
            "userName": userName,
            "password": password,
            "firstTime": true
        ]
        
        ref.child("email:\(email)").setValue(post)
        ref.observeSingleEvent(of: .childAdded) { DataSnapshot in
            print("成功建立\(DataSnapshot)")
        }
    }
    
    
    func firstTime(email: String, completed: @escaping(Int) -> Void) {
        let email = email.emailEncoder()
        
        ref.child("email:\(email)").child("firstTime").observeSingleEvent(of: .value) { [weak self] DataSnapshot in
            guard let self = self else { return }
            guard DataSnapshot.exists() else {
                print("節點不存在")
                return
            }
            guard let result = DataSnapshot.value as? Int else { return }
            
            if result == 1 {
                completed(result)
//                self.ref.child("email:\(email)").child("firstTime").setValue(false)
                print("使用者為第一次登入")
            } else {
                completed(result)
                print("使用者為舊用戶")
            }
        }
    }
}