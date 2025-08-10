//
//  WesternZodiac.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//

import Foundation

/// Western zodiac signs
public enum WesternZodiac: String, CaseIterable, Sendable {
    case aries = "Aries"
    case taurus = "Taurus"
    case gemini = "Gemini"
    case cancer = "Cancer"
    case leo = "Leo"
    case virgo = "Virgo"
    case libra = "Libra"
    case scorpio = "Scorpio"
    case sagittarius = "Sagittarius"
    case capricorn = "Capricorn"
    case aquarius = "Aquarius"
    case pisces = "Pisces"
    
    /// The symbol/emoji representation of the zodiac sign
    public var symbol: String {
        switch self {
        case .aries: return "♈"
        case .taurus: return "♉"
        case .gemini: return "♊"
        case .cancer: return "♋"
        case .leo: return "♌"
        case .virgo: return "♍"
        case .libra: return "♎"
        case .scorpio: return "♏"
        case .sagittarius: return "♐"
        case .capricorn: return "♑"
        case .aquarius: return "♒"
        case .pisces: return "♓"
        }
    }
    
    /// The element associated with this zodiac sign
    public var element: WesternElement {
        switch self {
        case .aries, .leo, .sagittarius: return .fire
        case .taurus, .virgo, .capricorn: return .earth
        case .gemini, .libra, .aquarius: return .air
        case .cancer, .scorpio, .pisces: return .water
        }
    }
    
    /// The modality (quality) of this zodiac sign
    public var modality: WesternModality {
        switch self {
        case .aries, .cancer, .libra, .capricorn: return .cardinal
        case .taurus, .leo, .scorpio, .aquarius: return .fixed
        case .gemini, .virgo, .sagittarius, .pisces: return .mutable
        }
    }
    
    /// The ruling planet(s) of this zodiac sign
    public var rulingPlanet: String {
        switch self {
        case .aries: return "Mars"
        case .taurus: return "Venus"
        case .gemini: return "Mercury"
        case .cancer: return "Moon"
        case .leo: return "Sun"
        case .virgo: return "Mercury"
        case .libra: return "Venus"
        case .scorpio: return "Mars & Pluto"
        case .sagittarius: return "Jupiter"
        case .capricorn: return "Saturn"
        case .aquarius: return "Saturn & Uranus"
        case .pisces: return "Jupiter & Neptune"
        }
    }
    
    /// Key personality traits associated with this sign
    public var traits: [String] {
        switch self {
        case .aries: return ["Courageous", "Determined", "Confident", "Enthusiastic"]
        case .taurus: return ["Reliable", "Patient", "Practical", "Devoted"]
        case .gemini: return ["Adaptable", "Outgoing", "Intelligent", "Curious"]
        case .cancer: return ["Intuitive", "Sentimental", "Compassionate", "Protective"]
        case .leo: return ["Creative", "Passionate", "Generous", "Warm-hearted"]
        case .virgo: return ["Analytical", "Kind", "Hardworking", "Practical"]
        case .libra: return ["Diplomatic", "Gracious", "Fair-minded", "Social"]
        case .scorpio: return ["Passionate", "Stubborn", "Resourceful", "Brave"]
        case .sagittarius: return ["Generous", "Idealistic", "Great sense of humor", "Adventurous"]
        case .capricorn: return ["Responsible", "Disciplined", "Self-control", "Good managers"]
        case .aquarius: return ["Progressive", "Original", "Independent", "Humanitarian"]
        case .pisces: return ["Compassionate", "Artistic", "Intuitive", "Gentle"]
        }
    }
    
    /// Date range for this sign (month and day only)
    public var dateRange: (start: (month: Int, day: Int), end: (month: Int, day: Int)) {
        switch self {
        case .aries: return ((3, 21), (4, 19))
        case .taurus: return ((4, 20), (5, 20))
        case .gemini: return ((5, 21), (6, 20))
        case .cancer: return ((6, 21), (7, 22))
        case .leo: return ((7, 23), (8, 22))
        case .virgo: return ((8, 23), (9, 22))
        case .libra: return ((9, 23), (10, 22))
        case .scorpio: return ((10, 23), (11, 21))
        case .sagittarius: return ((11, 22), (12, 21))
        case .capricorn: return ((12, 22), (1, 19))
        case .aquarius: return ((1, 20), (2, 18))
        case .pisces: return ((2, 19), (3, 20))
        }
    }
}
