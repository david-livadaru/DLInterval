//
//  Boundary.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

/// The type of boundary.
///
/// - closed: closed type boundary: **[**, **]**.
/// - open: open type boundary: **(**, **)**.
public enum BoundaryType {
    case closed, open
}

public struct Boundary: Comparable {
    /// The side which boundary is placed.
    ///
    /// - left: **left** side boundary.
    /// - right: **right** side boundary.
    public enum Side {
        case left, right
    }

    /// The type of boundary,
    public let type: BoundaryType
    /// The side of boundary.
    public let side: Side

    /// Initialize a boundary with type and side.
    ///
    /// - Parameters:
    ///   - type: The type of boundary,
    ///   - side: The side of boundary.
    public init(type: BoundaryType, side: Side) {
        self.type = type
        self.side = side
    }

    // MARK: Equatable

    public static func == (_ lhs: Boundary, _ rhs: Boundary) -> Bool {
        return lhs.side == rhs.side && lhs.type == rhs.type
    }

    // MARK: Comparable

    public static func < (_ lhs: Boundary, _ rhs: Boundary) -> Bool {
        switch (lhs.side, lhs.type, rhs.side, rhs.type) {
        case (.right, .open, .right, .closed), (.right, .open, .left, .closed), (.right, .open, .left, .open):
            return true
        case (.right, .closed, .left, .closed), (.right, .closed, .left, .open):
            return true
        case (.left, .closed, .left, .open):
            return true
        default:
            return false
        }
    }
}
