//
//  YinYang.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//

import Foundation

/// Yin and Yang energies
public enum ChineseYinYang: String, CaseIterable, Sendable {
    case yin = "Yin"
    case yang = "Yang"
    
    /// Symbol representation
    public var symbol: String {
        switch self {
        case .yin: return "☯"
        case .yang: return "☯"
        }
    }
}
