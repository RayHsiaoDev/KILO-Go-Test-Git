//
//  AuthManager2.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/2/17.
//

import Foundation
import Firebase

class AuthManager2 {
    
    static let share = AuthManager2()
    let user = Auth.auth().currentUser?.createProfileChangeRequest()
    var isSignin: Bool {
        return Auth.auth().currentUser != nil
    }
    var userEmail: String {
        guard let email = Auth.auth().currentUser?.email else {
            return String("沒有使用者")
        }
        return email
    }
    
    private init() {}
    
    
    func createAcount(email: String, password: String, userName: String, completed: @escaping( Result<Bool, Error>) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { userfeedback, error in
            if let error = error {
                completed(.failure(error))
            } else {
                completed(.success(true))
            }
        }
        user?.displayName = userName
        user?.commitChanges(completion: { error in
            print(error)
        })
        
        print(user?.displayName)
    }
    
    
    func userSignOut() {
        do { try Auth.auth().signOut() }
        catch { print("登出失敗") }
    }
    
    
    func userSignIn(email: String, password: String, completed: @escaping(Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { gfResult, error in
            
            if let error = error {
                print(error.localizedDescription)
                completed(.failure(error))
            } else {
                completed(.success(true))
            }
            
            
//            let error = error as NSError?
//            guard let error = error else { return }
//            let errorCode = AuthErrorCode(rawValue: error.code)
//
//            switch errorCode {
//            case .invalidEmail:
//                print("錯誤Email")
//            case .wrongPassword:
//                print("密碼錯誤")
//            case .networkError:
//                print("網路錯誤")
//            default:
//                print("還是這裡")
//            }
        }
    }
}
