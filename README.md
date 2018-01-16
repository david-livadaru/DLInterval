<div align="center" markdown="1">

![DLInterval Logo](DLIntervalLogo.png)



[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-4BC51D.svg?style=flat)](https://github.com/CocoaPods/CocoaPods)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange.svg?style=flat)](https://swift.org/package-manager/)
[![Swift 4.0](https://img.shields.io/badge/Swift_4.0-compatible-orange.svg?style=flat)](https://swift.org)

</div>

This Swift module aims to provide a solution to easily create mathematical intervals.

## Table of contents

- [Usage](https://github.com/davidlivadaru/DLInterval#usage)
	- [Creation](https://github.com/davidlivadaru/DLInterval#creation)
	- [Check](https://github.com/davidlivadaru/DLInterval#check)
	- [Unions](https://github.com/davidlivadaru/DLInterval#unions)
	- [Intersections](https://github.com/davidlivadaru/DLInterval#intersections)
	- [Clipping values](https://github.com/davidlivadaru/DLInterval#clipping-values)
- [Installation](https://github.com/davidlivadaru/DLInterval#installation)
	- [Carthage](https://github.com/davidlivadaru/DLInterval#1-carthage)
	- [CocoaPods](https://github.com/davidlivadaru/DLInterval#2-cocoapods)
	- [Swift Package Manager](https://github.com/davidlivadaru/DLInterval#3-swift-package-manager)
- [Contribution](https://github.com/davidlivadaru/DLInterval#contribution)
- [License](https://github.com/davidlivadaru/DLInterval#license)

## Usage

### Creation

`Interval` has constructors to create intervals using the notations we're used to from mathmatics:

`[1, 2]` and `(1, 2)`

```swift
let closedClosed = Interval([1..2])    // [1, 2]
let openOpen = Interval((1..2))        // (1, 2)
```

For convenience, range operators may be used:

```swift
let closedClosed = Interval(1...2)    // [1, 2]
let closedOpen = Interval(1..<2)      // [1, 2)
```

For half open intervals there are some new operators: 

*  `.>.`  - first boundary is open
*  `.<.`  - second boundary is open
*  `.><.` - both boundaries are open

```swift
let closedOpen: Interval = 1.<.2       // [1, 2)
let openClosed: Interval = 1.>.2       // (1, 2]
let openOpen: Interval = 1.><.2        // (1, 2)
```

To create intervals with infinity as boundaries:

```swift
let negativeInfinity: Interval = -Double.infinity.>.0 // (-inf, 0]
let positiveInfinity: Interval = 0.><.Double.Infinity // (0, +inf)
```

**Note**: Creating an interval with a closed boundary using infinity is ill-formed.

### Check

You may check if an interval contains a double value:

```swift
let closedOpen: Interval = 1.<.2
closedOpen.contains(1)   // true
closedOpen.contains(2)   // false
closedOpen.contains(1.1) // true
```

Checking infinity values:

```swift
let closedOpen: Interval = 1.<.2
closedOpen.contains(Double.infinity)  // false
closedOpen.contains(-Double.infinity) // false

let positiveInfinity: Interval = 0.><.Double.Infinity
positiveInfinity.contains(Double.infinity)  // true
positiveInfinity.contains(-Double.infinity) // false
```

### Unions

Creating a union from 2 intervals:

```swift
let firstInterval: Interval = -Double.infinity.>.0   // (-inf, 0]
let secondInterval: Interval = 0.><.1                // (0, 1)
let union = firstInterval.formUnion(secondInterval)  // (-inf, 1)
```

**Note**: `union` is a new data type called `UnionInterval`.

### Intersections

Find intersection of 2 intervals:

```swift
let firstInterval: Interval = -Double.infinity.><.1                 // (-inf, 1)
let secondInterval: Interval = -1.><.5.0                            // (-1, 5)
let intersection = firstInterval.intersection(with: secondInterval) // (-1, 1)
```
**Note**: `Interval`'s intersection returns an `Interval?` and `UnionInterval`'s returns `UnionInterval`.

### Clipping values

Available from `v1.1`.

An interval can clip a value within its boundaries:

```swift
let interval = [0..1]
let newValue = interval.clipValue(-0.5) // 0.0
```

**Note**: Open boundaries returns the closest value to boundary:

```swift
let interval = (-1..1)
let newValue = interval.clipValue(2.0) // 0.99999999
```

## Installation

Module requires Swift 4.0.

OS requirements:

- iOS 10.0 and later.
- watchOS 3.0 and later.
- tvOS 10.0 and later.
- macOS 10.12 and later.
- Ubuntu - check [official site](https://swift.org/download/#releases) to find which versions support Swift 4.0.


Choose your preferred dependency manager:

### 1. [Carthage](https://github.com/Carthage/Carthage)

Add the dependency in your `Cartfile`.

```
github "davidlivadaru/DLInterval"
```

If you need the framework only for a single OS, then I propose to use `--platform [iOS|macOS|watchOS|tvOS]` specifier when your perform `carthage update`.

You must import the module using:

```swift
import DLInterval_iOS
import DLInterval_macOS
import DLInterval_watchOS
import DLInterval_tvOS
```

### 2. [CocoaPods](https://github.com/CocoaPods/CocoaPods)

Add the dependency in your `Podfile`.

```
pod 'DLInterval_[iOS|macOS|watchOS|tvOS]' // use the OS the dependency refers to
```

You must import the module using:

```swift
import DLInterval_iOS
import DLInterval_macOS
import DLInterval_watchOS
import DLInterval_tvOS
```

### 3. [Swift Package Manager](https://swift.org/package-manager/)

Add the the following dependecy in your `Package.swift`:

```
dependencies: [
    .package(url: "https://github.com/davidlivadaru/DLInterval.git", .upToNextMajor(from: "1.0.0"))
]
```

and update your target's dependencies: 

```
targets: [
        .target(
            name: "YourTargetName",
            dependencies: ["DLInterval"])),
    ]
```

You must import the module using:

```swift
import DLInterval
```

## Contribution

Module is covered by unit tests, however, bugs always slip through.
If you find a bug in the module create an [issue](https://github.com/davidlivadaru/DLInterval/issues).

If you want to contribute on fixing bugs or implementing new features then create a [pull request](https://github.com/davidlivadaru/DLInterval/pulls).

## License

**DLInterval** is released under MIT license. See [LICENSE](LICENSE) for details.
