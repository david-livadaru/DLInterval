//
//  Boundary.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

public enum BoundaryType {
    case closed, open
}

public struct Boundary: Comparable {
    public enum Side {
        case left, right
    }

    public let type: BoundaryType
    public let side: Side

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
