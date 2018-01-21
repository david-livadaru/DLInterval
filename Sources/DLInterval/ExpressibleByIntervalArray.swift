//
//  ExpressibleByIntervalArray.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

/// Protocol used to provide support for creating types with an array of abstract intervals.
public protocol ExpressibleByIntervalArray {
    init(_ intervalArray: [AbstractInterval])
}
