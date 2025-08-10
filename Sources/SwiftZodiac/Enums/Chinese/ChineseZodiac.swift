//
//  ChineseZodiac.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//

import Foundation

/// Chinese zodiac animals
public enum ChineseZodiac: String, CaseIterable, Sendable {
    case rat = "Rat"
    case ox = "Ox"
    case tiger = "Tiger"
    case rabbit = "Rabbit"
    case dragon = "Dragon"
    case snake = "Snake"
    case horse = "Horse"
    case goat = "Goat"
    case monkey = "Monkey"
    case rooster = "Rooster"
    case dog = "Dog"
    case pig = "Pig"
    
    /// The emoji representation of the Chinese zodiac animal
    public var emoji: String {
        switch self {
        case .rat: return "🐀"
        case .ox: return "🐂"
        case .tiger: return "🐅"
        case .rabbit: return "🐇"
        case .dragon: return "🐉"
        case .snake: return "🐍"
        case .horse: return "🐴"
        case .goat: return "🐐"
        case .monkey: return "🐵"
        case .rooster: return "🐓"
        case .dog: return "🐕"
        case .pig: return "🐖"
        }
    }
    
    /// The element cycle for Chinese zodiac (changes every 2 years)
    public func element(for year: Int) -> ChineseElement {
        let elementIndex = ((year - 4) % 10) / 2
        return ChineseElement.allCases[elementIndex]
    }
    
    /// Yin or Yang energy
    public var yinYang: ChineseYinYang {
        switch self {
        case .rat, .tiger, .dragon, .horse, .monkey, .dog:
            return .yang
        case .ox, .rabbit, .snake, .goat, .rooster, .pig:
            return .yin
        }
    }
    
    /// Key personality traits for this Chinese zodiac sign
    public var traits: [String] {
        switch self {
        case .rat: return ["Quick-witted", "Resourceful", "Versatile", "Kind"]
        case .ox: return ["Diligent", "Dependable", "Strong", "Determined"]
        case .tiger: return ["Brave", "Confident", "Competitive", "Unpredictable"]
        case .rabbit: return ["Quiet", "Elegant", "Kind", "Responsible"]
        case .dragon: return ["Confident", "Intelligent", "Enthusiastic", "Ambitious"]
        case .snake: return ["Enigmatic", "Intelligent", "Wise", "Charming"]
        case .horse: return ["Animated", "Active", "Energetic", "Independent"]
        case .goat: return ["Calm", "Gentle", "Sympathetic", "Creative"]
        case .monkey: return ["Sharp", "Smart", "Curious", "Mischievous"]
        case .rooster: return ["Observant", "Hardworking", "Resourceful", "Courageous"]
        case .dog: return ["Loyal", "Honest", "Responsible", "Reliable"]
        case .pig: return ["Generous", "Compassionate", "Diligent", "Patient"]
        }
    }
    
    /// Lucky numbers associated with this sign
    public var luckyNumbers: [Int] {
        switch self {
        case .rat: return [2, 3]
        case .ox: return [1, 4]
        case .tiger: return [1, 3, 4]
        case .rabbit: return [3, 4, 6]
        case .dragon: return [1, 6, 7]
        case .snake: return [2, 8, 9]
        case .horse: return [2, 3, 7]
        case .goat: return [2, 7]
        case .monkey: return [4, 9]
        case .rooster: return [5, 7, 8]
        case .dog: return [3, 4, 9]
        case .pig: return [2, 5, 8]
        }
    }
}
