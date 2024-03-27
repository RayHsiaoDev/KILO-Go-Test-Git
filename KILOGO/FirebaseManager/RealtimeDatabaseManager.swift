//
//  RealtimeDatabaseManager.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/2/21.
//

import Foundation
import Firebase

enum foodtype {
    case breakfast
    case lucnch
    case dinner
}

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
    
    
    func creatKcal(email: String, date: String, breakfastKcal: Int, lunchKcal: Int, dinnerKcal: Int, sportKcal: Int) {
        let email = email.emailEncoder()
        let post: [String: Any] = [
            "早餐Kcal": breakfastKcal,
            "午餐Kcal": lunchKcal,
            "晚餐Kcal": dinnerKcal,
            "運動Kcal": sportKcal
        ]
        ref.child("email:\(email)").child("userData").child("\(date)").setValue(post)
        ref.observeSingleEvent(of: .childAdded) { DataSnapshot in
            print("成功建立\(DataSnapshot)")
        }
    }
    
    
    func getUserFoodData(email: String, date: String, completed: @escaping((NSDictionary) -> Void)) {
        let email = email.emailEncoder()
       
        ref.child("email:\(email)").child("userData").child(date).getData { error, dataSnapshot in
            guard error == nil else {
                print("有錯誤喔！如下\(error)")
                return
            }
            
            let foodData = dataSnapshot.value as? NSDictionary
            guard let foodData = foodData else { return }
//            print("這裡測試dic的取值\(foodData)")
            completed(foodData)
        }
    }
    
    
    func updateKcal(email: String, date: String, Kcal: Int, foodType: foodType) {
        let email = email.emailEncoder()
        var updataKcal: [String: Int] = [:]
        
        if foodType == .breakfast {
            updataKcal["早餐Kcal"] = Kcal
        } else if foodType == .lunch {
            updataKcal["午餐Kcal"] = Kcal
        } else if foodType == .dinner {
            updataKcal["晚餐Kcal"] = Kcal
        }
        
        ref.child("email:\(email)").child("userData").child("\(date)").updateChildValues(updataKcal)
        ref.observeSingleEvent(of: .childAdded) { DataSnapshot in
//            print("成功建立\(DataSnapshot)")
        }
    }
}
