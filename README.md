# Swift Zodiac

A dependency-free Swift library for calculating Western and Chinese zodiac signs. SwiftZodiac determines signs from dates, years, or strings; computes compatibility between signs; and exposes rich per-sign data — elements, modalities, ruling planets, traits, lucky numbers, and more — through a clean API plus ergonomic `Date`, `Int`, and `String` extensions.

## Features

- ♈ **Western zodiac** — `ZodiacCalculator.westernSign(for:)` resolves any of the 12 sun signs from a `Date` or an explicit month/day
- 🐉 **Chinese zodiac** — `ZodiacCalculator.chineseSign(for:)` returns the animal and its year-specific element from a `Date` or year
- 💞 **Compatibility** — `westernCompatibility(_:_:)` and `chineseCompatibility(_:_:)` rate any pairing as excellent, good, moderate, or challenging
- 🧬 **Rich Western data** — each `WesternZodiac` exposes its `symbol`, `element`, `modality`, `rulingPlanet`, `traits`, and `dateRange`
- 🀄 **Rich Chinese data** — each `ChineseZodiac` exposes its `emoji`, `yinYang`, `traits`, `luckyNumbers`, and `element(for:)`
- 📅 **Date extensions** — `Date` and `DateComponents` gain `westernZodiac`, `chineseZodiac`, `zodiacProfile`, and `zodiacDescription`
- 🔢 **Int extensions** — any year `Int` gains `chineseZodiac`, `chineseZodiacAnimal`, and `chineseZodiacElement`
- 🔤 **String parsing** — date strings gain `westernZodiac`, `chineseZodiac`, and `zodiacProfile`, parsed across 18+ formats with ISO 8601 fallback
- 🧾 **Combined profiles** — `ZodiacProfile` bundles both systems with a formatted `description` and merged `combinedTraits`
- 🔎 **Filtering helpers** — `westernSigns(for:)` lists all signs for a given element or modality
- 📦 **Sendable everywhere** — all public types are `Sendable` and the library has zero dependencies

## Requirements

- iOS 15.0+ / macOS 12.0+ / tvOS 15.0+ / watchOS 8.0+ / visionOS 1.0+
- Swift 6.1+
- Xcode 26.0+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/arraypress/swift-zodiac.git", from: "1.0.0")
]
```

Or in Xcode: **File → Add Package Dependencies…** and enter `https://github.com/arraypress/swift-zodiac`.

## Usage

### Western zodiac

```swift
import SwiftZodiac

let sign = ZodiacCalculator.westernSign(month: 8, day: 11)
print(sign.rawValue)        // "Leo"
print(sign.symbol)          // "♌"
print(sign.element)         // .fire
print(sign.modality)        // .fixed
print(sign.rulingPlanet)    // "Sun"
print(sign.traits)
```

### Chinese zodiac

```swift
import SwiftZodiac

let (animal, element) = ZodiacCalculator.chineseSign(for: 2024)
print(animal.rawValue)      // "Dragon"
print(animal.emoji)         // "🐉"
print(element.rawValue)     // "Wood"
print(animal.yinYang)       // .yang
print(animal.luckyNumbers)
```

### From a Date, Int, or String

```swift
import SwiftZodiac

let date = Date()
print(date.westernZodiac)               // e.g. .gemini
print(date.chineseZodiac.animal)        // e.g. .snake
print(date.zodiacDescription)

print(2024.chineseZodiacAnimal)         // .dragon

print("1990-05-15".westernZodiac ?? "?")        // .taurus
print("05/15/1990".zodiacProfile?.description ?? "")
```

### Compatibility

```swift
import SwiftZodiac

let western = ZodiacCalculator.westernCompatibility(.aries, .leo)
print("\(western.emoji) \(western.rawValue)")   // "💚 Excellent"

let chinese = ZodiacCalculator.chineseCompatibility(.rat, .dragon)
print(chinese.rawValue)                          // "Excellent"
```

### Complete profile

```swift
import SwiftZodiac

let profile = ZodiacProfile(date: Date())
print(profile.westernSign.rawValue)
print(profile.chineseSign.rawValue)
print(profile.chineseElement.rawValue)
print(profile.description)
print(profile.combinedTraits)
```

### Filtering signs

```swift
import SwiftZodiac

let fireSigns = ZodiacCalculator.westernSigns(for: .fire)        // [.aries, .leo, .sagittarius]
let cardinalSigns = ZodiacCalculator.westernSigns(for: .cardinal)
```

## How It Works

- **Western** signs are determined by month/day ranges across the 12 sun-sign boundaries.
- **Chinese** signs use the 12-year cycle starting from year 4 (Rat), combined with the five-element cycle to derive the element for a given year.
- **Compatibility** uses element/modality relationships for Western signs and traditional best/challenging-match tables for Chinese signs.
- **String parsing** tries 18+ common date formats followed by ISO 8601 before extracting a sign, returning `nil` when a string can't be parsed.

## Models

| Type | Kind | Description |
|------|------|-------------|
| `ZodiacCalculator` | struct | Static entry point: `westernSign`, `chineseSign`, `westernCompatibility`, `chineseCompatibility`, `westernSigns(for:)` |
| `ZodiacProfile` | struct | Combined profile: `birthDate`, `westernSign`, `chineseSign`, `chineseElement`, plus `description` and `combinedTraits` |
| `WesternZodiac` | enum | 12 sun signs with `symbol`, `element`, `modality`, `rulingPlanet`, `traits`, `dateRange` |
| `WesternElement` | enum | `fire`, `earth`, `air`, `water` with `emoji` |
| `WesternModality` | enum | `cardinal`, `fixed`, `mutable` |
| `ChineseZodiac` | enum | 12 animals with `emoji`, `yinYang`, `traits`, `luckyNumbers`, `element(for:)` |
| `ChineseElement` | enum | The five elements with `emoji` |
| `ChineseYinYang` | enum | `yin`, `yang` with `symbol` |
| `Compatibility` | enum | `excellent`, `good`, `moderate`, `challenging` with `emoji` |

## Use Cases

- Horoscope, dating, and personality apps
- Birthday and profile enrichment from a stored date
- Compatibility matching between two people
- Surfacing per-sign traits, elements, and lucky numbers

## Testing

```bash
swift test
```

The test suite covers Western and Chinese sign boundaries, compatibility tables, date/string/int extensions, and profile generation.

## License

MIT License — see LICENSE file for details.

## Author

Created by David Sherlock ([ArrayPress](https://github.com/arraypress)) in 2026.
