//
//  UnionInterval.swift
//  DLInterval
//
//  Created by David Livadaru on 3/13/17.
//

import Foundation

public struct UnionInterval: IntervalType, ExpressibleByArrayLiteral {
    public private (set) var intervals: [Interval]

    /// The lower boundary of union.
    public var lowerBoundary: IntervalBoundary? {
        return intervals.first?.lowerBoundary
    }

    /// The upper boundary of union.
    public var upperBoundary: IntervalBoundary? {
        return intervals.last?.upperBoundary
    }

    /// A union is empty if does not contain any intervals.
    public var isEmpty: Bool {
        return intervals.count == 0
    }

    public typealias Element = Interval

    /// Create a UnionInterval with an array of intervals.
    /// If intervals can form unions, then the UnionInterval will minimize the array of intervals.
    ///
    /// Example:
    /// ````
    /// let u = UnionInterval([1.><.2, 3.><.4]) // (1, 2) U (3, 4)
    /// let v = UnionInterval([1.>.2, 2.><.3]) // (1, 3)
    /// ````
    ///
    /// - Parameter elements: The array of intervals.
    public init(arrayLiteral elements: Element...) {
        self.intervals = elements
        mergeIntervals()
    }

    /// Append an Interval to the union.
    ///
    /// Example:
    /// ````
    /// var u = UnionInterval([1.><.2, 3.><.4]) // (1, 2) U (3, 4)
    /// u.append(5.><.6) // (1, 2) U (3, 4) U (5, 6)
    /// ````
    ///
    /// - Parameter interval: The interval to append.
    public mutating func append(_ interval: Interval) {
        append([interval])
    }

    /// Append a UnionInterval.
    /// Appending a union is the same operation as forming a union.
    ///
    /// - Parameter union: The union to append.
    public mutating func append(_ union: UnionInterval) {
        for interval in union.intervals {
            if let index = intervals.index(where: { $0 > interval }) {
                intervals.insert(interval, at: index)
            } else {
                intervals.append(interval)
            }
        }
        mergeIntervals()
    }

    /// Check the value is contained in the union.
    ///
    /// Examples:
    /// ````
    /// var u = UnionInterval([1.><.2, 3.><.4]) // (1, 2) U (3, 4)
    /// u.contains(3.5) // true
    /// u.contains(2.5) // false
    /// ````
    ///
    /// - Parameter value: The value to check.
    /// - Returns: *true* is the union contains the value, *false* otherwise.
    public func contains(_ value: Double) -> Bool {
        for interval in intervals {
            if interval.contains(value) {
                return true
            }
        }
        return false
    }

    /// Create an intersection between 2 unions.
    ///
    /// Examples:
    /// ````
    /// let u = UnionInterval([-1.><.2, 3.><.6]) // (-1, 2) U (3, 5)
    /// let v = UnionInterval([-1.><.1, 3.><.6]) // (-3, 1) U (4, 7)
    /// let intersection = u.intersection(v) // (-1, 1) U (4, 5)
    /// ````
    ///
    /// - Parameter other: The union to intersect with.
    /// - Returns: The intersection between **self** and **other**.
    ///     If there is no intersection, the returned union is empty.
    public func intersection(with other: UnionInterval) -> UnionInterval {
        var newUnion = UnionInterval()
        for selfInterval in intervals {
            for unionInterval in other.intervals {
                if let intersection = selfInterval.intersection(with: unionInterval) {
                    newUnion.append(intersection)
                }
            }
        }
        newUnion.mergeIntervals()
        return newUnion
    }

    // MARK: Private functionality

    private mutating func mergeIntervals() {
        guard canMergeIntervals() else { return }
        var newIntervals: [Interval] = []
        var index = 0
        while index < intervals.count - 1 {
            let current = intervals[index]
            let next = intervals[index + 1]

            if canMerge(current, with: next) {
                newIntervals.append(merge(current, with: next))
            } else {
                newIntervals.append(contentsOf: [current, next])
            }
            index += 2
        }
        if intervals.count % 2 == 1, let lastInterval = intervals.last {
            newIntervals.append(lastInterval)
        }
        intervals = newIntervals
        mergeIntervals()
    }

    private func canMergeIntervals() -> Bool {
        guard intervals.count >= 2 else { return false }
        for index in 0..<intervals.count - 1 {
            let current = intervals[index]
            let next = intervals[index + 1]
            if canMerge(current, with: next) {
                return true
            }
        }
        return false
    }

    private func canMerge(_ first: Interval, with second: Interval) -> Bool {
        if first.upperBoundary > second.lowerBoundary {
            return true
        }

        if first.upperBoundary.value == second.lowerBoundary.value &&
           (first.upperBoundary.boundary.type == .closed ||
            second.lowerBoundary.boundary.type == .closed) {
            return true
        }

        return false
    }

    private func merge(_ first: Interval, with second: Interval) -> Interval {
        return Interval(lowerBoundary: first.lowerBoundary, upperBoundary: second.upperBoundary)
    }
}
