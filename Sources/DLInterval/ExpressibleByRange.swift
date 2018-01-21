//
//  ExpressibleByRange.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

/// Protocol used to provide support for creating types with ranges.
public protocol ExpressibleByRange {
    associatedtype RangeBound: Comparable
    init(_ range: Range<RangeBound>)
}
