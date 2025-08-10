//
//  SwiftZodiacTests.swift
//  SwiftZodiacTests
//
//  Test suite for SwiftZodiac library
//
//  Created by David Sherlock on 10/08/2025.
//  Copyright © 2025. All rights reserved.
//

import XCTest
@testable import SwiftZodiac

final class SwiftZodiacTests: XCTestCase {
    
    // MARK: - Western Zodiac Tests
    
    func testWesternZodiacFromDate() {
        let tests: [(month: Int, day: Int, expected: WesternZodiac)] = [
            (3, 21, .aries),    // First day of Aries
            (4, 19, .aries),    // Last day of Aries
            (4, 20, .taurus),   // First day of Taurus
            (5, 20, .taurus),   // Last day of Taurus
            (12, 25, .capricorn), // Christmas
            (1, 1, .capricorn),   // New Year
            (2, 14, .aquarius),   // Valentine's Day
            (7, 4, .cancer),      // July 4th
            (10, 31, .scorpio),   // Halloween
            (11, 11, .scorpio),   // 11/11
        ]
        
        for (month, day, expected) in tests {
            let sign = ZodiacCalculator.westernSign(month: month, day: day)
            XCTAssertEqual(sign, expected, "Failed for \(month)/\(day)")
        }
    }
    
    func testWesternZodiacElements() {
        // Fire signs
        XCTAssertEqual(WesternZodiac.aries.element, .fire)
        XCTAssertEqual(WesternZodiac.leo.element, .fire)
        XCTAssertEqual(WesternZodiac.sagittarius.element, .fire)
        
        // Earth signs
        XCTAssertEqual(WesternZodiac.taurus.element, .earth)
        XCTAssertEqual(WesternZodiac.virgo.element, .earth)
        XCTAssertEqual(WesternZodiac.capricorn.element, .earth)
        
        // Air signs
        XCTAssertEqual(WesternZodiac.gemini.element, .air)
        XCTAssertEqual(WesternZodiac.libra.element, .air)
        XCTAssertEqual(WesternZodiac.aquarius.element, .air)
        
        // Water signs
        XCTAssertEqual(WesternZodiac.cancer.element, .water)
        XCTAssertEqual(WesternZodiac.scorpio.element, .water)
        XCTAssertEqual(WesternZodiac.pisces.element, .water)
    }
    
    func testWesternZodiacModalities() {
        // Cardinal signs
        XCTAssertEqual(WesternZodiac.aries.modality, .cardinal)
        XCTAssertEqual(WesternZodiac.cancer.modality, .cardinal)
        XCTAssertEqual(WesternZodiac.libra.modality, .cardinal)
        XCTAssertEqual(WesternZodiac.capricorn.modality, .cardinal)
        
        // Fixed signs
        XCTAssertEqual(WesternZodiac.taurus.modality, .fixed)
        XCTAssertEqual(WesternZodiac.leo.modality, .fixed)
        XCTAssertEqual(WesternZodiac.scorpio.modality, .fixed)
        XCTAssertEqual(WesternZodiac.aquarius.modality, .fixed)
        
        // Mutable signs
        XCTAssertEqual(WesternZodiac.gemini.modality, .mutable)
        XCTAssertEqual(WesternZodiac.virgo.modality, .mutable)
        XCTAssertEqual(WesternZodiac.sagittarius.modality, .mutable)
        XCTAssertEqual(WesternZodiac.pisces.modality, .mutable)
    }
    
    // MARK: - Chinese Zodiac Tests
    
    func testChineseZodiacFromYear() {
        let tests: [(year: Int, animal: ChineseZodiac, element: ChineseElement)] = [
            (2024, .dragon, .wood),  // 2024 - Wood Dragon
            (2023, .rabbit, .water), // 2023 - Water Rabbit
            (2022, .tiger, .water),  // 2022 - Water Tiger
            (2021, .ox, .metal),     // 2021 - Metal Ox
            (2020, .rat, .metal),    // 2020 - Metal Rat
            (2000, .dragon, .metal), // 2000 - Metal Dragon
            (1990, .horse, .metal),  // 1990 - Metal Horse
            (1984, .rat, .wood),     // 1984 - Wood Rat
        ]
        
        for (year, expectedAnimal, expectedElement) in tests {
            let result = ZodiacCalculator.chineseSign(for: year)
            XCTAssertEqual(result.animal, expectedAnimal, "Wrong animal for year \(year)")
            XCTAssertEqual(result.element, expectedElement, "Wrong element for year \(year)")
        }
    }
    
    func testChineseZodiacYinYang() {
        // Yang signs
        XCTAssertEqual(ChineseZodiac.rat.yinYang, .yang)
        XCTAssertEqual(ChineseZodiac.tiger.yinYang, .yang)
        XCTAssertEqual(ChineseZodiac.dragon.yinYang, .yang)
        XCTAssertEqual(ChineseZodiac.horse.yinYang, .yang)
        XCTAssertEqual(ChineseZodiac.monkey.yinYang, .yang)
        XCTAssertEqual(ChineseZodiac.dog.yinYang, .yang)
        
        // Yin signs
        XCTAssertEqual(ChineseZodiac.ox.yinYang, .yin)
        XCTAssertEqual(ChineseZodiac.rabbit.yinYang, .yin)
        XCTAssertEqual(ChineseZodiac.snake.yinYang, .yin)
        XCTAssertEqual(ChineseZodiac.goat.yinYang, .yin)
        XCTAssertEqual(ChineseZodiac.rooster.yinYang, .yin)
        XCTAssertEqual(ChineseZodiac.pig.yinYang, .yin)
    }
    
    // MARK: - Compatibility Tests
    
    func testWesternCompatibility() {
        // Same element (different signs) should be excellent
        XCTAssertEqual(
            ZodiacCalculator.westernCompatibility(.aries, .leo),
            .excellent
        )
        
        // Compatible elements should be good
        XCTAssertEqual(
            ZodiacCalculator.westernCompatibility(.aries, .gemini),
            .good
        )
        
        // Same sign - varies by sign
        XCTAssertEqual(
            ZodiacCalculator.westernCompatibility(.taurus, .taurus),
            .good  // Taurus does well with itself
        )
        
        XCTAssertEqual(
            ZodiacCalculator.westernCompatibility(.aries, .aries),
            .moderate  // Two rams might clash
        )
        
        // Opposite signs should be moderate
        XCTAssertEqual(
            ZodiacCalculator.westernCompatibility(.aries, .libra),
            .moderate
        )
        
        // Incompatible elements should be challenging
        XCTAssertEqual(
            ZodiacCalculator.westernCompatibility(.aries, .cancer),
            .challenging
        )
    }
    
    func testChineseCompatibility() {
        // Excellent matches
        XCTAssertEqual(
            ZodiacCalculator.chineseCompatibility(.rat, .dragon),
            .excellent
        )
        
        // Challenging matches
        XCTAssertEqual(
            ZodiacCalculator.chineseCompatibility(.rat, .horse),
            .challenging
        )
        
        // Same sign
        XCTAssertEqual(
            ZodiacCalculator.chineseCompatibility(.ox, .ox),
            .good
        )
    }
    
    // MARK: - Date Extension Tests
    
    func testDateExtensions() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        // Test Western zodiac
        if let date = formatter.date(from: "1990-03-25") {
            XCTAssertEqual(date.westernZodiac, .aries)
        }
        
        // Test Chinese zodiac
        if let date = formatter.date(from: "2000-01-01") {
            let chinese = date.chineseZodiac
            XCTAssertEqual(chinese.animal, .dragon)
            XCTAssertEqual(chinese.element, .metal)
        }
    }
    
    // MARK: - String Extension Tests
    
    func testStringExtensions() {
        // Test various date formats
        XCTAssertEqual("1990-03-25".westernZodiac, .aries)
        XCTAssertEqual("03/25/1990".westernZodiac, .aries)
        XCTAssertEqual("March 25, 1990".westernZodiac, .aries)
        
        // Test Chinese zodiac
        let chinese = "2024-01-01".chineseZodiac
        XCTAssertEqual(chinese?.animal, .dragon)
        XCTAssertEqual(chinese?.element, .wood)
        
        // Test invalid date
        XCTAssertNil("not a date".westernZodiac)
    }
    
    // MARK: - Int Extension Tests
    
    func testIntExtensions() {
        let year = 2024
        let chinese = year.chineseZodiac
        XCTAssertEqual(chinese.animal, .dragon)
        XCTAssertEqual(chinese.element, .wood)
        
        XCTAssertEqual(2024.chineseZodiacAnimal, .dragon)
        XCTAssertEqual(2024.chineseZodiacElement, .wood)
    }
    
    // MARK: - Profile Tests
    
    func testZodiacProfile() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: "1990-07-15") {
            let profile = ZodiacProfile(date: date)
            
            XCTAssertEqual(profile.westernSign, .cancer)
            XCTAssertEqual(profile.chineseSign, .horse)
            XCTAssertEqual(profile.chineseElement, .metal)
            
            // Check description contains expected elements
            XCTAssertTrue(profile.description.contains("Cancer"))
            XCTAssertTrue(profile.description.contains("Horse"))
            XCTAssertTrue(profile.description.contains("Metal"))
            
            // Check combined traits
            XCTAssertFalse(profile.combinedTraits.isEmpty)
        }
    }
    
    // MARK: - Performance Tests
    
    func testPerformanceWesternZodiac() {
        measure {
            for _ in 0..<1000 {
                _ = ZodiacCalculator.westernSign(month: 7, day: 15)
            }
        }
    }
    
    func testPerformanceChineseZodiac() {
        measure {
            for year in 1900..<2100 {
                _ = ZodiacCalculator.chineseSign(for: year)
            }
        }
    }
}
