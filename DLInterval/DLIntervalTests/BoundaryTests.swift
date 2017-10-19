//
//  BoundaryTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/20/17.
//

import XCTest
@testable import DLInterval_iOS

class BoundaryTests: XCTestCase {
    func testConstructor_left_open() {
        let boundary = Boundary(type: .open, side: .left)
        XCTAssertTrue(boundary.type == .open)
        XCTAssertTrue(boundary.side == .left)
    }

    func testEquality() {
    }
}
