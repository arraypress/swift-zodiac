//
//  Element.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//

import Foundation

/// The four elements in Western astrology
public enum WesternElement: String, CaseIterable, Sendable {
    case fire = "Fire"
    case earth = "Earth"
    case air = "Air"
    case water = "Water"
    
    /// Emoji representation of the element
    public var emoji: String {
        switch self {
        case .fire: return "🔥"
        case .earth: return "🌍"
        case .air: return "💨"
        case .water: return "💧"
        }
    }
}
