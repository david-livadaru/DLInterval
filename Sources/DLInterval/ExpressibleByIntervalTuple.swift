//
//  ExpressibleByIntervalTuple.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

/// Protocol used to provide support for creating types with a tuple which contains an abstract interval.
public protocol ExpressibleByIntervalTuple {
    init(_ intervalTuple: (AbstractInterval))
}
