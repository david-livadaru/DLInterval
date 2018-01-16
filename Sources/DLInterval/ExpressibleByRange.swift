//
//  ExpressibleByRange.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

public protocol ExpressibleByRange {
    associatedtype RangeBound: Comparable
    init(_ range: Range<RangeBound>)
}
