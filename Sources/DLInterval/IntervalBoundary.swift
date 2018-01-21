//
//  IntervalBoundary.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

/// A type which holds a boundary and a value.
public struct IntervalBoundary: Comparable {
    /// The value hold by IntervalBoundary.
    public let value: Double
    /// The boundary hold by IntervalBoundary.
    public let boundary: Boundary

    /// Create an IntervalBoundary with a value and boundary.
    ///
    /// - Parameters:
    ///   - value: The value.
    ///   - boundary: The boundary.
    public init(value: Double, boundary: Boundary) {
        self.value = value
        self.boundary = boundary
    }

    // MARK: Internal interface

    func contains(_ value: Double) -> Bool {
        if abs(value) == Double.infinity && abs(self.value) == Double.infinity {
            return true
        }

        switch (boundary.side, boundary.type) {
        case (.left, .open):
            return value > self.value
        case (.left, .closed):
            return value >= self.value
        case (.right, .open):
            return value < self.value
        case (.right, .closed):
            return value <= self.value
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
