//
//  IntervalContainsTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/25/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

import XCTest
@testable import DLInterval_iOS

class IntervalContainsTests: XCTestCase {
    func testContains_forSuccess() {
        let interval = Interval(0.0...1.0)
        XCTAssertTrue(interval.contains(0.0))
        XCTAssertTrue(interval.contains(1.0))
        XCTAssertTrue(interval.contains(0.5))
        XCTAssertTrue(interval.contains(0.25))
    }

    func testContains_forSuccess2() {
        let interval = Interval(0.0..<1.0)
        XCTAssertTrue(interval.contains(0.0))
        XCTAssertTrue(interval.contains(0.5))
        XCTAssertTrue(interval.contains(0.9999))
    }

    func testContains_forFailure() {
        let interval = Interval(0.0...1.0)
        XCTAssertFalse(interval.contains(-1.0))
        XCTAssertFalse(interval.contains(2.0))
        XCTAssertFalse(interval.contains(5))
        XCTAssertFalse(interval.contains(Double.infinity))
        XCTAssertFalse(interval.contains(-Double.infinity))
    }

    func testContains_forFailure2() {
        let interval = Interval(0.0..<1.0)
        XCTAssertFalse(interval.contains(-1.0))
        XCTAssertFalse(interval.contains(1.0))
        XCTAssertFalse(interval.contains(Double.infinity))
        XCTAssertFalse(interval.contains(-Double.infinity))
    }
}
