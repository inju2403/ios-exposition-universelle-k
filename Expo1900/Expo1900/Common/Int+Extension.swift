//
//  Int+Extension.swift
//  Expo1900
//
//  Created by 이승주 on 2022/01/17.
//

import Foundation

extension Int {
    func numberToDecimalString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let visitors = numberFormatter.string(from: NSNumber(value: self)) else {
            return "0"
        }
        
        return visitors
    }
}
