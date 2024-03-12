//
//  Post.swift
//  Post
//
//  Created by 陳韋綸 on 2021/11/10.
//

import Foundation

struct Post: Codable {
    let id: String
    let caption: String
    let postedDate: String
    let postUrlString: String
    var likers: [String]
    
    var storgeReference: String? {
        guard let username = UserDefaults.standard.string(forKey: "username") else {
            return nil
        }
        return "\(username)/posts/\(id).png"
    }
}
