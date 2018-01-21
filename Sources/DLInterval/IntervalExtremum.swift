//
//  IntervalExtremum.swift
//  DLInterval
//
//  Created by David Livadaru on 1/15/18.
//

import Foundation

public extension IntervalBoundary {
    /// The closest value to boundary's **value**.
    /// If it's a closed boundary, than that value is boundary's **value**.
    var extremum: Double {
        guard boundary.type != .closed else { return value }

        switch boundary.side {
        case .left:
            return value.next
        case .right:
            return value.previous
        }
    }
}

/// Compute The minimum value between an interval boundary and a double value.
///
/// - Parameters:
///   - lhs: The interval boundary.
///   - rhs: The double value.
/// - Returns: The minimum value between an interval boundary and a double value.
public func min(_ lhs: IntervalBoundary, _ rhs: Double) -> Double {
    return min(lhs.extremum, rhs)
}

/// Compute The minimum value between an interval boundary and a double value.
///
/// - Parameters:
///   - lhs: The double value.
///   - rhs: The interval boundary.
/// - Returns: The minimum value between an interval boundary and a double value.
public func min(_ lhs: Double, _ rhs: IntervalBoundary) -> Double {
    return min(rhs, lhs)
}

/// Compute The maximum value between an interval boundary and a double value.
///
/// - Parameters:
///   - lhs: The interval boundary.
///   - rhs: The double value.
/// - Returns: The maximum value between an interval boundary and a double value.
public func max(_ lhs: IntervalBoundary, _ rhs: Double) -> Double {
    return max(lhs.extremum, rhs)
}

/// Compute The maximum value between an interval boundary and a double value.
///
/// - Parameters:
///   - lhs: The double value.
///   - rhs: The interval boundary.
/// - Returns: The maximum value between an interval boundary and a double value.
public func max(_ lhs: Double, _ rhs: IntervalBoundary) -> Double {
    return max(rhs, lhs)
}
