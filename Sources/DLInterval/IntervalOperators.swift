//
//  IntervalOperators.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

infix operator ..: RangeFormationPrecedence
infix operator .>.: RangeFormationPrecedence
infix operator .<.: RangeFormationPrecedence
infix operator .><.: RangeFormationPrecedence

/// Create an abstract interval.
///
/// - Parameters:
///   - lowerBound: The lower bound of abstract interval.
///   - upperBound: The upper bound of abstract interval.
/// - Returns: The the abstract interval.
public func .. (_ lowerBound: Double, _ upperBound: Double) -> AbstractInterval {
    return (lowerBound: lowerBound, upperBound: upperBound)
}

/// Create an open closed interval: (lowerBound, upperBound].
///
/// - Parameters:
///   - lowerBound: The lower bound of the interval.
///   - upperBound: The upper bound of the interval.
/// - Returns: The interval.
public func .>. (_ lowerBound: Double, _ upperBound: Double) -> Interval {
    return Interval(lowerBoundary: IntervalBoundary(value: lowerBound,
                                                 boundary: Boundary(type: .open, side: .left)),
                    upperBoundary: IntervalBoundary(value: upperBound,
                                                 boundary: Boundary(type: .closed, side: .right)))
}

/// Create a closed open interval: [lowerBound, upperBound).
///
/// - Parameters:
///   - lowerBound: The lower bound of the interval.
///   - upperBound: The upper bound of the interval.
/// - Returns: The interval.
public func .<. (_ lowerBound: Double, _ upperBound: Double) -> Interval {
    return Interval(lowerBoundary: IntervalBoundary(value: lowerBound,
                                                 boundary: Boundary(type: .closed, side: .left)),
                    upperBoundary: IntervalBoundary(value: upperBound,
                                                 boundary: Boundary(type: .open, side: .right)))
}

/// Create an open open interval: (lowerBound, upperBound).
///
/// - Parameters:
///   - lowerBound: The lower bound of the interval.
///   - upperBound: The upper bound of the interval.
/// - Returns: The interval.
public func .><. (_ lowerBound: Double, _ upperBound: Double) -> Interval {
    return Interval(lowerBoundary: IntervalBoundary(value: lowerBound,
                                                 boundary: Boundary(type: .open, side: .left)),
                    upperBoundary: IntervalBoundary(value: upperBound,
                                                 boundary: Boundary(type: .open, side: .right)))
}
