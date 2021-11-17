//
//  NumberExtensions.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import Foundation

extension Double {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let numberWithCommas = numberFormatter.string(from: NSNumber(value: self))
        else {
            assertionFailure("Number with commas formatting failed")
            return String(self)
        }
        return numberWithCommas
    }
}
