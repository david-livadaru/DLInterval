//
//  IntervalType.swift
//  DLInterval
//
//  Created by David Livadaru on 3/13/17.
//

import Foundation

/// A type to which Interval and UnioInterval conforms.
public protocol IntervalType {
    func contains(_ element: Double) -> Bool
}
