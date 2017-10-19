//
//  ExpressibleByClosedRange.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

public protocol ExpressibleByClosedRange {
    associatedtype RangeBound: Comparable
    init(_ closedRange: ClosedRange<RangeBound>)
}
