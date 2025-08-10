//
//  Compatibility.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//

import Foundation

/// Compatibility levels between signs
public enum Compatibility: String, CaseIterable, Sendable {
    case excellent = "Excellent"
    case good = "Good"
    case moderate = "Moderate"
    case challenging = "Challenging"
    
    /// Emoji representation
    public var emoji: String {
        switch self {
        case .excellent: return "💚"
        case .good: return "💛"
        case .moderate: return "🧡"
        case .challenging: return "💔"
        }
    }
}
