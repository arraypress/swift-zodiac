//
//  ZodiacProfile.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//

import Foundation

/// Complete zodiac profile for a birth date
public struct ZodiacProfile: Sendable {
    public let birthDate: Date
    public let westernSign: WesternZodiac
    public let chineseSign: ChineseZodiac
    public let chineseElement: ChineseElement
    
    /// Initialize a zodiac profile from a birth date
    /// - Parameter date: The birth date
    public init(date: Date) {
        self.birthDate = date
        self.westernSign = ZodiacCalculator.westernSign(for: date)
        let chinese = ZodiacCalculator.chineseSign(for: date)
        self.chineseSign = chinese.animal
        self.chineseElement = chinese.element
    }
    
    /// A formatted description of the complete zodiac profile
    public var description: String {
        "\(westernSign.symbol) \(westernSign.rawValue) | \(chineseSign.emoji) \(chineseElement.rawValue) \(chineseSign.rawValue)"
    }
    
    /// Combined personality traits from both zodiacs
    public var combinedTraits: [String] {
        Array(Set(westernSign.traits + chineseSign.traits))
    }
}
