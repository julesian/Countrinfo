//
//  ColorExtensions.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import UIKit

extension UIColor {
    
    /// initializes a UIColor from a hex string
    ///
    /// - Parameters:
    ///     - hex: hex string with format #RRGGBB
    ///     - alpha: alpha of the color from 0 to 1
    convenience init(hex: String, alpha: CGFloat = 1) {
        // Force # in String for consistency
        let firstCharacter = hex[hex.startIndex]
        assert(firstCharacter == "#", "starting # not found in given hex string, format should be: #RRGGBB")

        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.index(after: scanner.currentIndex) // skip #

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0xFF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0xFF) / 255.0,
            alpha: alpha
        )
    }
}
