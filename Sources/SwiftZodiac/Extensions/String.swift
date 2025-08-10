//
//  String.swift
//  SwiftZodiac
//
//  Created by David Sherlock on 10/08/2025.
//

import Foundation

extension String {
    
    /// List of supported date formats for parsing
    private static let dateFormats = [
        "yyyy-MM-dd",
        "MM/dd/yyyy",
        "dd/MM/yyyy",
        "yyyy/MM/dd",
        "MMMM d, yyyy",
        "MMM d, yyyy",
        "d MMMM yyyy",
        "d MMM yyyy",
        "dd-MM-yyyy",
        "MM-dd-yyyy",
        "yyyy.MM.dd",
        "dd.MM.yyyy",
        "yyyyMMdd",
        "yyyy-MM-dd'T'HH:mm:ssZ",
        "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        "yyyy-MM-dd HH:mm:ss",
        "MM/dd/yyyy HH:mm:ss",
        "dd/MM/yyyy HH:mm:ss"
    ]
    
    /// Try to parse a date string and get its Western zodiac sign
    /// - Returns: The Western zodiac sign if the date can be parsed, nil otherwise
    public var westernZodiac: WesternZodiac? {
        guard let date = self.toDate() else { return nil }
        return date.westernZodiac
    }
    
    /// Try to parse a date string and get its Chinese zodiac sign
    /// - Returns: The Chinese zodiac sign and element if the date can be parsed, nil otherwise
    public var chineseZodiac: (animal: ChineseZodiac, element: ChineseElement)? {
        guard let date = self.toDate() else { return nil }
        return date.chineseZodiac
    }
    
    /// Try to parse a date string and get its complete zodiac profile
    /// - Returns: The zodiac profile if the date can be parsed, nil otherwise
    public var zodiacProfile: ZodiacProfile? {
        guard let date = self.toDate() else { return nil }
        return date.zodiacProfile
    }
    
    /// Convert string to date using various formats
    /// - Returns: Date if successfully parsed, nil otherwise
    private func toDate() -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        for format in Self.dateFormats {
            formatter.dateFormat = format
            if let date = formatter.date(from: self) {
                return date
            }
        }
        
        // Try ISO8601 decoder as fallback
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        if let date = isoFormatter.date(from: self) {
            return date
        }
        
        isoFormatter.formatOptions = [.withInternetDateTime]
        return isoFormatter.date(from: self)
    }
    
}
