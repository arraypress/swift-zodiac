# Swift Zodiac

![Swift Version](https://img.shields.io/badge/Swift-6.1+-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2015%2B%20|%20macOS%2012%2B%20|%20tvOS%2015%2B%20|%20watchOS%208%2B%20|%20visionOS%201%2B-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)

**A comprehensive zodiac sign calculator library for Swift**

Calculate Western and Chinese zodiac signs, compatibility scores, and personality traits with full type safety and modern Swift features.

---

## ✨ Features

- 🔮 **Western Zodiac** - All 12 signs with elements, modalities, ruling planets, and traits
- 🐉 **Chinese Zodiac** - All 12 animals with five elements, Yin/Yang energy, and lucky numbers
- 💕 **Compatibility Calculations** - Sophisticated matching for both zodiac systems
- 📅 **Smart Date Parsing** - Supports 40+ date formats automatically
- 🎯 **Type Safe** - Full Swift 6 concurrency support with Sendable compliance
- ⚡ **High Performance** - Optimized calculations with minimal overhead
- 📱 **Multi-Platform** - Works on iOS, macOS, tvOS, watchOS, and visionOS
- 🧪 **Thoroughly Tested** - Comprehensive test coverage

## 📋 Requirements

| Platform | Minimum Version |
|----------|----------------|
| iOS | 15.0+ |
| macOS | 12.0+ |
| tvOS | 15.0+ |
| watchOS | 8.0+ |
| visionOS | 1.0+ |
| **Swift** | **6.1+** |
| **Xcode** | **15.0+** |

## 📦 Installation

### Swift Package Manager

Add SwiftZodiac to your project through Xcode:

1. File → Add Package Dependencies
2. Enter: `https://github.com/arraypress/swift-zodiac.git`
3. Select "Up to Next Major Version" with "1.0.0"

Or add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/arraypress/swift-zodiac.git", from: "1.0.0")
]
```

## 🚀 Quick Start

### Basic Usage

```swift
import SwiftZodiac

// From date components
let sign = ZodiacCalculator.westernSign(month: 3, day: 25)  // Aries
let chinese = ZodiacCalculator.chineseSign(for: 1990)        // Horse + Metal

// From Date
let today = Date()
let todaySign = today.westernZodiac           // e.g., Capricorn
let todayChinese = today.chineseZodiac        // e.g., (dragon, wood)

// From String (multiple formats supported)
"1990-03-25".westernZodiac                    // Aries
"March 25, 1990".westernZodiac                // Aries
"25/03/1990".chineseZodiac                    // (horse, metal)

// From Year
2024.chineseZodiacAnimal                      // Dragon
2024.chineseZodiacElement                     // Wood
```

### Western Zodiac

```swift
let sign = WesternZodiac.leo

// Access properties
print(sign.symbol)          // ♌
print(sign.element)         // .fire
print(sign.modality)        // .fixed
print(sign.rulingPlanet)    // "Sun"
print(sign.traits)          // ["Creative", "Passionate", "Generous", "Warm-hearted"]

// Get date range
let range = sign.dateRange  // ((7, 23), (8, 22))
```

### Chinese Zodiac

```swift
let year = 2024
let chinese = year.chineseZodiac  // (dragon, wood)

// Access properties
let dragon = ChineseZodiac.dragon
print(dragon.emoji)         // 🐉
print(dragon.yinYang)        // .yang
print(dragon.traits)         // ["Confident", "Intelligent", "Enthusiastic", "Ambitious"]
print(dragon.luckyNumbers)   // [1, 6, 7]
```

### Compatibility

```swift
// Western compatibility
let compatibility = ZodiacCalculator.westernCompatibility(.leo, .sagittarius)
print(compatibility)         // .excellent (same element - Fire)

// Chinese compatibility
let chineseCompat = ZodiacCalculator.chineseCompatibility(.dragon, .monkey)
print(chineseCompat)        // .excellent

// Check compatibility with emoji
print(compatibility.emoji)   // 💚
```

### Complete Profile

```swift
let profile = ZodiacProfile(date: Date())
print(profile.description)
// "♑ Capricorn | 🐉 Wood Dragon"

print(profile.combinedTraits)
// Combined personality traits from both zodiacs
```

## 🎯 Advanced Features

### Date Parsing

SwiftZodiac can parse dates from various formats automatically:

```swift
"1990-03-25".westernZodiac              // ISO format
"03/25/1990".westernZodiac              // US format
"25/03/1990".westernZodiac              // European format
"March 25, 1990".westernZodiac          // Long format
"25 Mar 1990".westernZodiac             // Short format
"1990-03-25T10:30:00Z".westernZodiac    // ISO 8601
```

### Filtering by Properties

```swift
// Get all Fire signs
let fireSigns = ZodiacCalculator.westernSigns(for: .fire)
// [.aries, .leo, .sagittarius]

// Get all Cardinal signs
let cardinalSigns = ZodiacCalculator.westernSigns(for: .cardinal)
// [.aries, .cancer, .libra, .capricorn]
```

### Extensions

The library provides convenient extensions for common types:

```swift
// Date extensions
let date = Date()
date.westernZodiac                    // Direct access to Western zodiac
date.chineseZodiac                    // Direct access to Chinese zodiac
date.zodiacProfile                    // Complete profile

// String extensions
"1990-03-25".westernZodiac           // Parse and get zodiac
"1990-03-25".zodiacProfile           // Parse and get full profile

// Int extensions (for Chinese zodiac)
1990.chineseZodiacAnimal             // Horse
1990.chineseZodiacElement            // Metal
```

## 📊 Compatibility Logic

### Western Zodiac Compatibility

- **Excellent**: Same element, different signs (e.g., Aries + Leo)
- **Good**: Compatible elements (Fire + Air, Earth + Water), harmonious same signs
- **Moderate**: Opposite signs (attraction with tension), challenging same signs
- **Challenging**: Incompatible elements

### Chinese Zodiac Compatibility

Based on traditional Chinese astrology trigrams and compatibility charts:
- **Excellent**: Traditional best matches (e.g., Dragon + Monkey)
- **Good**: Same sign or harmonious matches
- **Moderate**: Neutral combinations
- **Challenging**: Traditional conflicts (e.g., Rat + Horse)

## 🧪 Testing

The library includes comprehensive tests:

```bash
swift test
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

SwiftZodiac is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## 🙏 Acknowledgments

- Based on traditional Western and Chinese astrology systems
- Date parsing inspired by common date format requirements
- Built with Swift 6 concurrency in mind

## 📬 Contact

- **GitHub Issues**: [Report a bug](https://github.com/arraypress/swift-zodiac/issues)
- **Discussions**: [Ask questions](https://github.com/arraypress/swift-zodiac/discussions)

---

Made with ❤️ and ♑ energy
