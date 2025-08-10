//
//  Int.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//


extension Int {
    
    /// Get the Chinese zodiac sign for this year
    public var chineseZodiac: (animal: ChineseZodiac, element: ChineseElement) {
        ZodiacCalculator.chineseSign(for: self)
    }
    
    /// Get just the Chinese zodiac animal for this year
    public var chineseZodiacAnimal: ChineseZodiac {
        ZodiacCalculator.chineseSign(for: self).animal
    }
    
    /// Get just the Chinese element for this year
    public var chineseZodiacElement: ChineseElement {
        ZodiacCalculator.chineseSign(for: self).element
    }
    
}
