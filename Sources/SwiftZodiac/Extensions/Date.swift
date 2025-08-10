//
//  Date.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//

import Foundation

extension Date {
    
    /// Get the Western zodiac sign for this date
    public var westernZodiac: WesternZodiac {
        ZodiacCalculator.westernSign(for: self)
    }
    
    /// Get the Chinese zodiac sign for this date
    public var chineseZodiac: (animal: ChineseZodiac, element: ChineseElement) {
        ZodiacCalculator.chineseSign(for: self)
    }
    
    /// Get the complete zodiac profile for this date
    public var zodiacProfile: ZodiacProfile {
        ZodiacProfile(date: self)
    }
    
    /// Get zodiac information as a formatted string
    public var zodiacDescription: String {
        zodiacProfile.description
    }
    
}

extension DateComponents {
    
    /// Get the Western zodiac sign for these date components
    public var westernZodiac: WesternZodiac? {
        guard let month = month, let day = day else { return nil }
        return ZodiacCalculator.westernSign(month: month, day: day)
    }
    
    /// Get the Chinese zodiac sign for these date components
    public var chineseZodiac: (animal: ChineseZodiac, element: ChineseElement)? {
        guard let year = year else { return nil }
        return ZodiacCalculator.chineseSign(for: year)
    }
    
}
