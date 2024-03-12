//
//  EmailContanis.swift
//  EmailContanis
//
//  Created by 陳韋綸 on 2021/11/16.
//

import Foundation

extension String {
    
    func emailEncoder() -> String {
        return self.replacingOccurrences(of: ".", with: "_")
    }
    
    
    func emailDecoder() -> String {
        return self.replacingOccurrences(of: "_", with: ".")
    }
}
