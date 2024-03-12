//
//  IntToString.swift
//  IntToString
//
//  Created by 陳韋綸 on 2021/11/11.
//

import Foundation

extension Int {
    func IntToString(with: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedMunber = numberFormatter.string(from: NSNumber(value: with)) else {
            return ""
        }
        return formattedMunber
    }
}

