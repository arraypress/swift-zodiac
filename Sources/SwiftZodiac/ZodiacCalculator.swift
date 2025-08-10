//
//  SwiftZodiac.swift
//  SwiftZodiac
//
//  A comprehensive zodiac sign calculator library for Swift
//  Supports Western and Chinese zodiac systems with extensive features
//
//  Created by David Sherlock on 10/08/2025.
//  Copyright © 2025. All rights reserved.
//

import Foundation

/// Main calculator for zodiac signs
public struct ZodiacCalculator {
    
    // MARK: - Western Zodiac Calculations
    
    /// Calculate Western zodiac sign from a date
    /// - Parameter date: The birth date
    /// - Returns: The Western zodiac sign
    public static func westernSign(for date: Date) -> WesternZodiac {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day], from: date)
        
        guard let month = components.month, let day = components.day else {
            return .aries // Default fallback
        }
        
        return westernSign(month: month, day: day)
    }
    
    /// Calculate Western zodiac sign from month and day
    /// - Parameters:
    ///   - month: Birth month (1-12)
    ///   - day: Birth day (1-31)
    /// - Returns: The Western zodiac sign
    public static func westernSign(month: Int, day: Int) -> WesternZodiac {
        switch (month, day) {
        case (3, 21...31), (4, 1...19): return .aries
        case (4, 20...30), (5, 1...20): return .taurus
        case (5, 21...31), (6, 1...20): return .gemini
        case (6, 21...30), (7, 1...22): return .cancer
        case (7, 23...31), (8, 1...22): return .leo
        case (8, 23...31), (9, 1...22): return .virgo
        case (9, 23...30), (10, 1...22): return .libra
        case (10, 23...31), (11, 1...21): return .scorpio
        case (11, 22...30), (12, 1...21): return .sagittarius
        case (12, 22...31), (1, 1...19): return .capricorn
        case (1, 20...31), (2, 1...18): return .aquarius
        case (2, 19...29), (3, 1...20): return .pisces
        default: return .aries // Fallback for invalid dates
        }
    }
    
    // MARK: - Chinese Zodiac Calculations
    
    /// Calculate Chinese zodiac sign from a date
    /// - Parameter date: The birth date
    /// - Returns: The Chinese zodiac sign and its element for that year
    public static func chineseSign(for date: Date) -> (animal: ChineseZodiac, element: ChineseElement) {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        return chineseSign(for: year)
    }
    
    /// Calculate Chinese zodiac sign from a year
    /// - Parameter year: The birth year
    /// - Returns: The Chinese zodiac sign and its element for that year
    public static func chineseSign(for year: Int) -> (animal: ChineseZodiac, element: ChineseElement) {
        // Chinese zodiac cycle starts from year 4 (Rat)
        let baseYear = 4
        let index = (year - baseYear) % 12
        let adjustedIndex = index < 0 ? index + 12 : index
        
        let animal = ChineseZodiac.allCases[adjustedIndex]
        let element = animal.element(for: year)
        
        return (animal, element)
    }
    
    // MARK: - Compatibility Calculations
    
    /// Calculate compatibility between two Western zodiac signs
    /// - Parameters:
    ///   - sign1: First zodiac sign
    ///   - sign2: Second zodiac sign
    /// - Returns: Compatibility level
    public static func westernCompatibility(_ sign1: WesternZodiac, _ sign2: WesternZodiac) -> Compatibility {
        // Opposite signs can be complementary but challenging
        let oppositePairs: [(WesternZodiac, WesternZodiac)] = [
            (.aries, .libra), (.taurus, .scorpio), (.gemini, .sagittarius),
            (.cancer, .capricorn), (.leo, .aquarius), (.virgo, .pisces)
        ]
        
        for pair in oppositePairs {
            if (sign1 == pair.0 && sign2 == pair.1) || (sign1 == pair.1 && sign2 == pair.0) {
                return .moderate
            }
        }
        
        // Same element - generally excellent compatibility
        if sign1.element == sign2.element {
            // Same sign can be tricky - they understand each other but may lack balance
            if sign1 == sign2 {
                // Some signs handle same-sign relationships better than others
                switch sign1 {
                case .libra, .pisces, .cancer, .taurus:
                    // These signs tend to do well with themselves (peaceful, nurturing)
                    return .good
                case .aries, .leo, .scorpio, .capricorn:
                    // Strong personalities that might clash or compete
                    // Aries: two rams butting heads
                    // Leo: two lions wanting center stage
                    // Scorpio: intensity overload
                    // Capricorn: power struggles, workaholism
                    return .moderate
                case .gemini, .sagittarius, .aquarius, .virgo:
                    // Gemini/Sagittarius/Aquarius: need variety
                    // Virgo: can be overly critical of each other
                    return .moderate
                }
            }
            // Different signs of same element work great together
            return .excellent
        }
        
        // Compatible elements
        let compatiblePairs: Set<Set<WesternElement>> = [
            [.fire, .air],
            [.earth, .water]
        ]
        
        if compatiblePairs.contains([sign1.element, sign2.element]) {
            return .good
        }
        
        return .challenging
    }
    
    /// Calculate compatibility between two Chinese zodiac signs
    /// - Parameters:
    ///   - sign1: First Chinese zodiac sign
    ///   - sign2: Second Chinese zodiac sign
    /// - Returns: Compatibility level
    public static func chineseCompatibility(_ sign1: ChineseZodiac, _ sign2: ChineseZodiac) -> Compatibility {
        // Best matches based on traditional Chinese astrology
        let excellentMatches: [ChineseZodiac: Set<ChineseZodiac>] = [
            .rat: [.dragon, .monkey, .ox],
            .ox: [.snake, .rooster, .rat],
            .tiger: [.dragon, .horse, .pig],
            .rabbit: [.goat, .pig, .dog],
            .dragon: [.rooster, .rat, .monkey],
            .snake: [.rooster, .ox, .monkey],
            .horse: [.tiger, .goat, .dog],
            .goat: [.rabbit, .horse, .pig],
            .monkey: [.rat, .dragon, .snake],
            .rooster: [.ox, .snake, .dragon],
            .dog: [.rabbit, .tiger, .horse],
            .pig: [.tiger, .rabbit, .goat]
        ]
        
        // Challenging matches
        let challengingMatches: [ChineseZodiac: Set<ChineseZodiac>] = [
            .rat: [.horse, .rabbit],
            .ox: [.goat, .horse],
            .tiger: [.monkey, .snake],
            .rabbit: [.rooster, .rat],
            .dragon: [.dog, .rabbit],
            .snake: [.pig, .tiger],
            .horse: [.rat, .ox],
            .goat: [.ox, .dog],
            .monkey: [.tiger, .pig],
            .rooster: [.rabbit, .dog],
            .dog: [.dragon, .goat],
            .pig: [.snake, .monkey]
        ]
        
        if excellentMatches[sign1]?.contains(sign2) == true {
            return .excellent
        }
        
        if challengingMatches[sign1]?.contains(sign2) == true {
            return .challenging
        }
        
        if sign1 == sign2 {
            return .good
        }
        
        return .moderate
    }
    
    // MARK: - Helper Methods
    
    /// Get all Western zodiac signs for a specific element
    /// - Parameter element: The element to filter by
    /// - Returns: Array of zodiac signs with that element
    public static func westernSigns(for element: WesternElement) -> [WesternZodiac] {
        WesternZodiac.allCases.filter { $0.element == element }
    }
    
    /// Get all Western zodiac signs for a specific modality
    /// - Parameter modality: The modality to filter by
    /// - Returns: Array of zodiac signs with that modality
    public static func westernSigns(for modality: WesternModality) -> [WesternZodiac] {
        WesternZodiac.allCases.filter { $0.modality == modality }
    }
    
}
