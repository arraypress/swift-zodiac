//
//  ChineseElement.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//

import Foundation

/// The five elements in Chinese astrology
public enum ChineseElement: String, CaseIterable, Sendable {
    case wood = "Wood"
    case fire = "Fire"
    case earth = "Earth"
    case metal = "Metal"
    case water = "Water"
    
    /// Emoji representation
    public var emoji: String {
        switch self {
        case .wood: return "🌳"
        case .fire: return "🔥"
        case .earth: return "🌍"
        case .metal: return "🔩"
        case .water: return "💧"
        }
    }
}
