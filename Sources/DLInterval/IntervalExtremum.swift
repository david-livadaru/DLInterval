//
//  IntervalExtremum.swift
//  DLInterval
//
//  Created by David Livadaru on 1/15/18.
//

import Foundation

public extension IntervalBoundary {
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

public func min(_ lhs: IntervalBoundary, _ rhs: Double) -> Double {
    return min(lhs.extremum, rhs)
}

public func min(_ lhs: Double, _ rhs: IntervalBoundary) -> Double {
    return min(rhs, lhs)
}

public func max(_ lhs: IntervalBoundary, _ rhs: Double) -> Double {
    return max(lhs.extremum, rhs)
}

public func max(_ lhs: Double, _ rhs: IntervalBoundary) -> Double {
    return max(rhs, lhs)
}
