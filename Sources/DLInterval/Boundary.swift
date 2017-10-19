//
//  Boundary.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

public struct Boundary: Comparable {
    public enum BoundaryType {
        case closed, open
    }
    
    public enum Side {
        case left, right
    }
    
    let type: BoundaryType
    let side: Side
    
    // MARK: Equatable
    
    public static func ==(_ lhs: Boundary, _ rhs: Boundary) -> Bool {
        return lhs.side == rhs.side && lhs.type == rhs.type
    }
    
    // MARK: Comparable
    
    public static func <(_ lhs: Boundary, _ rhs: Boundary) -> Bool {
        switch (lhs.side, lhs.type, rhs.side, rhs.type) {
        case (.right, .open, .right, .closed):
            fallthrough
        case (.left, .closed, .left, .open):
            return true
        default:
            return false
        }
    }
}
