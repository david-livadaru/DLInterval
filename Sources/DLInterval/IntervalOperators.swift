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

public func .. (_ lowerBoundary: Double, _ upperBoundary: Double) -> AbstractInterval {
    return (lowerBoundary: lowerBoundary, upperBoundary: upperBoundary)
}

public func .>. (_ lowerBoundary: Double, _ upperBoundary: Double) -> Interval {
    return Interval(lowerBoundary: IntervalBoundary(value: lowerBoundary,
                                                 boundary: Boundary(type: .open, side: .left)),
                    upperBoundary: IntervalBoundary(value: upperBoundary,
                                                 boundary: Boundary(type: .closed, side: .right)))
}

public func .<. (_ lowerBoundary: Double, _ upperBoundary: Double) -> Interval {
    return Interval(lowerBoundary: IntervalBoundary(value: lowerBoundary,
                                                 boundary: Boundary(type: .closed, side: .left)),
                    upperBoundary: IntervalBoundary(value: upperBoundary,
                                                 boundary: Boundary(type: .open, side: .right)))
}

public func .><. (_ lowerBoundary: Double, _ upperBoundary: Double) -> Interval {
    return Interval(lowerBoundary: IntervalBoundary(value: lowerBoundary,
                                                 boundary: Boundary(type: .open, side: .left)),
                    upperBoundary: IntervalBoundary(value: upperBoundary,
                                                 boundary: Boundary(type: .open, side: .right)))
}
