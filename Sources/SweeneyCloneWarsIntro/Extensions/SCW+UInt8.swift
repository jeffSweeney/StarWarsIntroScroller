//
//  SCW+UInt8.swift
//
//
//  Created by Jeffrey Sweeney on 9/22/24.
//

import Foundation

extension UInt8 {
    /// Single digit roman numeral support. Anything > 9 will result in `???` for now.
    var asSingleDigitRomanNumeral: String {
        switch self {
        case 1:
            return "I"
        case 2:
            return "II"
        case 3:
            return "III"
        case 4:
            return "IV"
        case 5:
            return "V"
        case 6:
            return "VI"
        case 7:
            return "VII"
        case 8:
            return "VIII"
        case 9:
            return "IX"
        default:
            return "???"
        }
    }
}
