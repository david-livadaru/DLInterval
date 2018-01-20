//
//  IntervalBoundary.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

public struct IntervalBoundary: Comparable {
    public let value: Double
    public let boundary: Boundary

    public init(value: Double, boundary: Boundary) {
        self.value = value
        self.boundary = boundary
    }

    // MARK: Public interface

    public func contains(_ element: Double) -> Bool {
        if abs(element) == Double.infinity && abs(value) == Double.infinity {
            return true
        }

        switch (boundary.side, boundary.type) {
        case (.left, .open):
            return element > value
        case (.left, .closed):
            return element >= value
        case (.right, .open):
            return element < value
        case (.right, .closed):
            return element <= value
        }
    }

    func intersects(other: IntervalBoundary, strictBoundaryTypeCheck: Bool = true) -> Bool {
        if boundary.side == other.boundary.side {
            return true
        }

        let diff = intersectionDiffence(with: other)
        if strictBoundaryTypeCheck == false, boundary.type == .closed || other.boundary.type == .closed {
            return diff <= 0.0
        } else {
            if diff == 0, boundary.type == .closed, other.boundary.type == .closed {
                return true
            }
            return diff < 0.0
        }
    }

    // MARK: Equatable

    public static func == (lhs: IntervalBoundary, rhs: IntervalBoundary) -> Bool {
        return lhs.boundary == rhs.boundary && lhs.value == rhs.value
    }

    // MARK: Comparable

    public static func < (lhs: IntervalBoundary, rhs: IntervalBoundary) -> Bool {
        if lhs.value == rhs.value {
            return lhs.boundary < rhs.boundary
        } else {
            return lhs.value < rhs.value
        }
    }

    // MARK: Private functionality

    private func intersectionDiffence(with other: IntervalBoundary) -> Double {
        let left: Double
        let right: Double

        if boundary.side == .left {
            left = value
            right = other.value
        } else {
            left = other.value
            right = value
        }
        return left - right
    }
}