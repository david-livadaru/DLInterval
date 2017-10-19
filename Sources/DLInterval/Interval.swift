//
//  Interval.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

public typealias AbstractInterval = (lowerBoundary: Double, upperBoundary: Double)

public struct Interval: IntervalType, ExpressibleByArrayLiteral, ExpressibleByIntervalArray,
ExpressibleByIntervalTuple, ExpressibleByClosedRange, ExpressibleByRange, Comparable {
    
    public let lowerBoundary: IntervalBoundary
    public let upperBoundary: IntervalBoundary
    
    public init(lowerBoundary: IntervalBoundary, upperBoundary: IntervalBoundary) {
        self.lowerBoundary = lowerBoundary
        self.upperBoundary = upperBoundary
        
        validateBounds()
    }
    
    // MARK: ExpressibleByArrayLiteral
    
    public typealias Element = AbstractInterval
    
    public init(arrayLiteral elements: Element...) {
        Interval.validateIntervalArray(elements)
        
        let first = elements.first!
        lowerBoundary = IntervalBoundary(value: first.lowerBoundary,
                                         boundary: Boundary(type: .closed, side: .left))
        upperBoundary = IntervalBoundary(value: first.upperBoundary,
                                         boundary: Boundary(type: .closed, side: .right))
        
        validateBounds()
    }
    
    // MARK: ExpressibleByIntervalArray
    
    public init(_ intervalArray: [AbstractInterval]) {
        Interval.validateIntervalArray(intervalArray)
        
        let first = intervalArray.first!
        lowerBoundary = IntervalBoundary(value: first.lowerBoundary,
                                         boundary: Boundary(type: .closed, side: .left))
        upperBoundary = IntervalBoundary(value: first.upperBoundary,
                                         boundary: Boundary(type: .closed, side: .right))
        
        validateBounds()
    }
    
    // MARK: ExpressibleByIntervalTuple
    
    public init(_ intervalTuple: (AbstractInterval)) {
        lowerBoundary = IntervalBoundary(value: intervalTuple.lowerBoundary,
                                         boundary: Boundary(type: .open, side: .left))
        upperBoundary = IntervalBoundary(value: intervalTuple.upperBoundary,
                                         boundary: Boundary(type: .open, side: .right))
        
        validateBounds()
    }
    
    // MARK: ExpressibleByClosedRange
    
    public typealias RangeBound = Double
    
    public init(_ closedRange: ClosedRange<RangeBound>) {
        lowerBoundary = IntervalBoundary(value: closedRange.lowerBound,
                                         boundary: Boundary(type: .closed, side: .left))
        upperBoundary = IntervalBoundary(value: closedRange.upperBound,
                                         boundary: Boundary(type: .closed, side: .right))
        
        validateBounds()
    }
    
    // MARK: ExpressibleByRange
    
    public init(_ range: Range<RangeBound>) {
        lowerBoundary = IntervalBoundary(value: range.lowerBound,
                                         boundary: Boundary(type: .closed, side: .left))
        upperBoundary = IntervalBoundary(value: range.upperBound,
                                         boundary: Boundary(type: .open, side: .right))
        
        validateBounds()
    }
    
    // MARK: Public interface
    
    public func contains(_ element: Double) -> Bool {
        return lowerBoundary.contains(element) && upperBoundary.contains(element)
    }
    
    public func intersection(with other: Interval) -> Interval? {
        var lower: IntervalBoundary! // ! is safe because will be set before usage
        if contains(other.lowerBoundary) {
            lower = other.lowerBoundary
        } else if other.contains(lowerBoundary) {
            lower = lowerBoundary
        } else {
            return nil
        }
        
        let upper = min(other.upperBoundary, upperBoundary)
        return Interval(lowerBoundary: lower, upperBoundary: upper)
    }
    
    public func formUnion(_ other: Interval) -> UnionInterval {
        return [self, other]
    }
    
    // MARK: Comparable
    
    public static func <(_ lhs: Interval, _ rhs: Interval) -> Bool {
        return lhs.lowerBoundary < rhs.lowerBoundary
    }
    
    // MARK: Equatable
    
    public static func ==(_ lhs: Interval, _ rhs: Interval) -> Bool {
        return lhs.lowerBoundary == rhs.lowerBoundary && lhs.lowerBoundary == rhs.upperBoundary
    }
    
    // MARK: Private functionality
    
    private func validateBounds() {
        assert(upperBoundary >= lowerBoundary, "Cannot create an interval with lowerBoundary > upperBoundary.")
        
        assert(lowerBoundary.boundary.side == .left, "Left boundary must have .left side")
        assert(upperBoundary.boundary.side == .right, "Left boundary must have .right side")
        
        
        switch (lowerBoundary.boundary.type, upperBoundary.boundary.type) {
        case (.closed, .open):
            assert(lowerBoundary.value != -Double.infinity, "Cannot create an interval closed in -infinity.")
            assert(upperBoundary.value != lowerBoundary.value, "Cannot create a closed open interval with the same bound value.")
        case (.open, .closed):
            assert(upperBoundary.value != lowerBoundary.value, "Cannot create an open closed interval with the same bound value.")
            assert(upperBoundary.value != Double.infinity, "Cannot create an interval closed in infinity.")
        case (.closed, .closed):
            assert(lowerBoundary.value != -Double.infinity, "Cannot create an interval closed in -infinity.")
            assert(upperBoundary.value != Double.infinity, "Cannot create an interval closed in infinity.")
        case (.open, .open):
            assert(upperBoundary.value != lowerBoundary.value, "Cannot create a bounded interval with the same bound value.")
        }
    }
    
    private func contains(_ element: IntervalBoundary) -> Bool {
        return element <= upperBoundary && element >= lowerBoundary
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
