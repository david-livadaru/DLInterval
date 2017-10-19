//
//  ExpressibleByIntervalArray.swift
//  DLInterval
//
//  Created by David Livadaru on 3/12/17.
//

import Foundation

public protocol ExpressibleByIntervalArray {
    init(_ intervalArray: [AbstractInterval])
}
