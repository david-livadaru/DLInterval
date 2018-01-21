//
//  Interval.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

/// A type for an abstract interval.
public typealias AbstractInterval = (lowerBound: Double, upperBound: Double)

/// The type of an Interval.
public struct Interval: Comparable, ExpressibleByArrayLiteral, ExpressibleByIntervalArray,
ExpressibleByIntervalTuple, ExpressibleByClosedRange, ExpressibleByRange, IntervalType {

    public let lowerBoundary: IntervalBoundary
    public let upperBoundary: IntervalBoundary

    /// Create an Interval by lower and upper boundaries.
    ///
    /// - Parameters:
    ///   - lowerBoundary: The lowerBoundary.
    ///   - upperBoundary: The upperBoundary.
    public init(lowerBoundary: IntervalBoundary, upperBoundary: IntervalBoundary) {
        self.lowerBoundary = lowerBoundary
        self.upperBoundary = upperBoundary

        validateBounds()
    }

    // MARK: ExpressibleByArrayLiteral

    public typealias Element = AbstractInterval

    /// Create an Interval using array literal.
    ///
    /// Examples:
    /// ````
    /// let i: Interval = [1..2]
    /// let j = Interval([3..4])
    /// ````
    public init(arrayLiteral elements: Element...) {
        Interval.validateIntervalArray(elements)

        let first = elements.first!
        lowerBoundary = IntervalBoundary(value: first.lowerBound,
                                         boundary: Boundary(type: .closed, side: .left))
        upperBoundary = IntervalBoundary(value: first.upperBound,
                                         boundary: Boundary(type: .closed, side: .right))

        validateBounds()
    }

    // MARK: ExpressibleByIntervalArray

    /// Create an Interval using array literal.
    ///
    /// Examples:
    /// ````
    /// let i: Interval = [1..2]
    /// let j = Interval([3..4])
    /// ````
    public init(_ intervalArray: [AbstractInterval]) {
        Interval.validateIntervalArray(intervalArray)

        let first = intervalArray.first!
        lowerBoundary = IntervalBoundary(value: first.lowerBound,
                                         boundary: Boundary(type: .closed, side: .left))
        upperBoundary = IntervalBoundary(value: first.upperBound,
                                         boundary: Boundary(type: .closed, side: .right))

        validateBounds()
    }

    /// Create an Interval using an array of Double.
    /// **Note:** 2 doubles must be provided.
    ///
    /// Example:
    /// ````
    /// let interval = Interval([1, 2])
    /// ````
    ///
    /// - Parameter boundaryValues: The array of doubles.
    public init(_ boundaryValues: [Double]) {
        assert(boundaryValues.count > 1, "Cannot create an interval with less than 2 doubles")
        if boundaryValues.count > 2 {
            print("The following values are ignored \(boundaryValues[2..<boundaryValues.endIndex])")
        }

        lowerBoundary = IntervalBoundary(value: boundaryValues[0],
                                         boundary: Boundary(type: .closed, side: .left))
        upperBoundary = IntervalBoundary(value: boundaryValues[1],
                                         boundary: Boundary(type: .closed, side: .right))

        validateBounds()
    }

    // MARK: ExpressibleByIntervalTuple

    /// Create an Interval using a tuple with an AbstractInterval.
    ///
    /// Example:
    /// ````
    /// let interval = Interval([0..0])
    /// ````
    ///
    /// - Parameter intervalTuple: The tuple with an AbstractInterval.
    public init(_ intervalTuple: (AbstractInterval)) {
        lowerBoundary = IntervalBoundary(value: intervalTuple.lowerBound,
                                         boundary: Boundary(type: .open, side: .left))
        upperBoundary = IntervalBoundary(value: intervalTuple.upperBound,
                                         boundary: Boundary(type: .open, side: .right))

        validateBounds()
    }

    // MARK: ExpressibleByClosedRange

    public typealias RangeBound = Double

    /// Create a closed closed interval using a closed range.
    ///
    /// Example:
    /// ````
    /// let interval = Interval(1...2) // [1, 2]
    /// ````
    ///
    /// - Parameter range: The closed range.
    public init(_ closedRange: ClosedRange<RangeBound>) {
        lowerBoundary = IntervalBoundary(value: closedRange.lowerBound,
                                         boundary: Boundary(type: .closed, side: .left))
        upperBoundary = IntervalBoundary(value: closedRange.upperBound,
                                         boundary: Boundary(type: .closed, side: .right))

        validateBounds()
    }

    // MARK: ExpressibleByRange

    /// Create an Interval using a range.
    ///
    /// Example:
    /// ````
    /// let interval = Interval(1..<2) // [1, 2)
    /// ````
    ///
    /// - Parameter range: The range.
    public init(_ range: Range<RangeBound>) {
        lowerBoundary = IntervalBoundary(value: range.lowerBound,
                                         boundary: Boundary(type: .closed, side: .left))
        upperBoundary = IntervalBoundary(value: range.upperBound,
                                         boundary: Boundary(type: .open, side: .right))

        validateBounds()
    }

    // MARK: Public interface

    /// Check if the Interval contains a value.
    ///
    /// Example:
    /// ````
    /// let interval = Interval(1..<2) // [1, 2)
    /// interval.contains(1.5) // true
    /// ````
    ///
    /// - Parameter value: The value to check.
    /// - Returns: *true* if the Interval contains the value, *false* otherwise.
    public func contains(_ value: Double) -> Bool {
        return lowerBoundary.contains(value) && upperBoundary.contains(value)
    }

    /// Find the intersection between 2 intervals.
    ///
    /// Example:
    /// ````
    /// let a: Interval = 1.<.3 // [1, 3)
    /// let b: Interval = 2.>.4 // (2, 4]
    /// let intersection = a.intersection(with: b) // (2, 3)
    /// ````
    ///
    /// - Parameter other: The interval to create intersection with.
    /// - Returns: The intersection between *self* and *other* if there is any.
    public func intersection(with other: Interval) -> Interval? {
        let min = Swift.min(self, other)
        let max = Swift.max(self, other)

        let lower: IntervalBoundary
        if min.upperBoundary.intersects(other: max.lowerBoundary) {
            lower = max.lowerBoundary
        } else {
            return nil
        }

        let upper = Swift.min(other.upperBoundary, upperBoundary)
        return Interval(lowerBoundary: lower, upperBoundary: upper)
    }

    /// Form a union between 2 intervals.
    ///
    /// Example:
    /// ````
    /// let a: Interval = 1...2 // [1, 2]
    /// let b: Interval = 2.>.4 // (2, 4]
    /// let union = a.formUnion(b) // [1, 4]
    /// ````
    ///
    /// - Parameter other: The interval to create union with.
    /// - Returns: The union between *self* and *other*.
    public func formUnion(_ other: Interval) -> UnionInterval {
        return [self, other]
    }

    /// Clip a value to an interval.
    ///
    /// Examples:
    /// ````
    /// let a: Interval = 1...2 // [1, 2]
    /// a.clipValue(0) // 1.0
    /// a.clipValue(1.5) // 1.5
    /// let b: Interval = 2.>.4 // (2, 4]
    /// b.clipValue(1.5) // a value little greater than 2.0 but far smaller than 2.1
    /// ````
    ///
    /// - Parameter value: The value to clip.
    /// - Returns: The clipped value.
    ///     If the value exceeds an open boundary then value within the intervalue will be returned.
    /// - Version: 1.2.0
    public func clipValue(_ value: Double) -> Double {
        let minimum = min(value, upperBoundary)
        return max(minimum, lowerBoundary)
    }

    // MARK: Comparable

    public static func < (_ lhs: Interval, _ rhs: Interval) -> Bool {
        if lhs.lowerBoundary == rhs.lowerBoundary {
            return lhs.upperBoundary < rhs.upperBoundary
        } else {
            return lhs.lowerBoundary < rhs.lowerBoundary
        }
    }

    // MARK: Equatable

    public static func == (_ lhs: Interval, _ rhs: Interval) -> Bool {
        return lhs.lowerBoundary == rhs.lowerBoundary && lhs.upperBoundary == rhs.upperBoundary
    }

    // MARK: Private functionality

    private func validateBounds() {
        assert(upperBoundary.value >= lowerBoundary.value,
               "Cannot create an interval with lower value greater upper value.")

        assert(lowerBoundary.boundary.side == .left, "Lower boundary must have .left side")
        assert(upperBoundary.boundary.side == .right, "Upper boundary must have .right side")

        switch (lowerBoundary.boundary.type, upperBoundary.boundary.type) {
        case (.closed, .open):
            assert(lowerBoundary.value != -Double.infinity, "Cannot create an interval closed in -infinity.")
            assert(upperBoundary.value != lowerBoundary.value,
                   "Cannot create a closed open interval with the same bound value.")
        case (.open, .closed):
            assert(upperBoundary.value != lowerBoundary.value,
                   "Cannot create an open closed interval with the same bound value.")
            assert(upperBoundary.value != Double.infinity, "Cannot create an interval closed in infinity.")
        case (.closed, .closed):
            assert(lowerBoundary.value != -Double.infinity, "Cannot create an interval closed in -infinity.")
            assert(upperBoundary.value != Double.infinity, "Cannot create an interval closed in infinity.")
        case (.open, .open):
            assert(upperBoundary.value != lowerBoundary.value,
                   "Cannot create a bounded interval with the same bound value.")
        }
    }

    private static func validateIntervalArray(_ array: [AbstractInterval]) {
        assert(array.count > 0, "Cannot initialize Interval with empty array.")
        if array.count > 1 {
            var ignoredElements = array
            ignoredElements.removeFirst()
            if ignoredElements.count > 0 {
                print("The following elements are ignored: \(ignoredElements)")
            }
        }
    }
}
