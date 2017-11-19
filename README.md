<div align="center" markdown="1">

![DLInterval Logo](DLIntervalLogo.png)

</div>

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-4BC51D.svg?style=flat)](https://github.com/CocoaPods/CocoaPods)
[![Swift 4.0](https://img.shields.io/badge/Swift_4.0-compatible-orange.svg?style=flat)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange.svg?style=flat)](https://swift.org/package-manager/)


This Swift module aims to provide a solution to easily create mathemical intervals.

## Table of contents

- [Usage](https://github.com/davidlivadaru/DLInterval#usage)
- [Installation](https://github.com/davidlivadaru/DLInterval#installation)
	- [Carthage](https://github.com/davidlivadaru/DLInterval#2-carthage)
	- [CocoaPods](https://github.com/davidlivadaru/DLInterval#3-cocoapods)
	- [Swift Package Manager](https://github.com/davidlivadaru/DLInterval#3-cocoapods)
- [Tips](https://github.com/davidlivadaru/DLInterval#tips)
- [Contribution](https://github.com/davidlivadaru/DLInterval#contribution)
- [License](https://github.com/davidlivadaru/DLInterval#license)

## Usage

`Interval` has constructors to create intervals using the notations we're used to from mathmatics:

`[1, 2]` and `(1, 2)`

```swift
let closedClosed = Interval([1..2])    // [1, 2]
let openOpen = Interval((1..2))        // (1, 2)
```

For convenience, range operators may be used.

```swift
let closedClosed2: Interval = 1...2    // [1, 2]
let closedOpen2: Interval = 1..<2      // [1, 2)
```

For half open intervals, there are some new operators: 

*  `.>.`  - first boundary is open
*  `.<.`  - second boundary is open
*  `.><.` - both boundaries are open

```swift
let closedOpen: Interval = 1.<.2       // [1, 2)
let openClosed: Interval = 1.>.2       // (1, 2]
let openOpen: Interval = 1.><.2        // (1, 2)
```

To create intervals with infinity as boundaries

```swift
let negativeInfinity: Interval = -Double.infinity.>.0 // (-inf, 0]
let positiveInfinity: Interval = 0.><.Double.Infinity // (0, +inf)
```

Note that creating an interval with a closed boundary using infinity will fail.

## Installation

Module requires Swift 4.0.

OS requirements:

- iOS 10.0 and later.
- watchOS 3.0 and later.
- tvOS 10.0 and later.
- macOS 10.11 and later.
- Ubuntu check [official site](https://swift.org/download/#releases) which provides support for Swift 4.0.


Choose your preffered dependency manager:

### 1. [Carthage](https://github.com/Carthage/Carthage)

Add the dependency in your `Cartfile`.

```
github "davidlivadaru/DLInterval"
```

### 2. [CocoaPods](https://github.com/CocoaPods/CocoaPods)

Add the dependency in your `Podfile`.

```
pod 'DLInterval'
```

### 3. [Swift Package Manager](https://swift.org/package-manager/)

Add the the following dependecy in your `Package.swift`.

```
dependencies: [
    .package(url: "https://github.com/davidlivadaru/DLInterval.git", .upToNextMinor(from: "1.0.0"))
]
```

## Contribution

Module is covered by units. However, bugs always slip through.
If you find a bug in the module create an [issue](https://github.com/davidlivadaru/DLInterval/issues).

If you want contribute on fixing bugs or implementing new features, then create a [pull request](https://github.com/davidlivadaru/DLInterval/pulls).

## License

**DLInterval** is released under MIT license. See [LICENSE](LICENSE) for details.