//
//  IntervalUnionTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/25/17.
//

import XCTest
@testable import DLInterval

class IntervalUnionTests: XCTestCase {
    static var allTests = [
        ("testUnion", testUnion),
        ("testUnion2", testUnion2),
        ("testUnion3", testUnion3),
        ("testUnion4", testUnion4)
    ]
    func testUnion() {
        let firstInterval: Interval = -Double.infinity.><.0
        let secondInterval: Interval = -1.><.1
        let union = firstInterval.formUnion(secondInterval)
        XCTAssertTrue(union.intervals.count == 1)
        XCTAssertTrue(union.intervals[0] == -Double.infinity.><.1)
    }

    func testUnion2() {
        let firstInterval: Interval = -Double.infinity.>.0
        let secondInterval: Interval = 0.><.1
        let union = firstInterval.formUnion(secondInterval)
        XCTAssertTrue(union.intervals.count == 1)
        XCTAssertTrue(union.intervals[0] == -Double.infinity.><.1)
    }

    func testUnion3() {
        let firstInterval: Interval = -Double.infinity.><.0
        let secondInterval: Interval = 0.><.1
        let union = firstInterval.formUnion(secondInterval)
        XCTAssertTrue(union.intervals.count == 2)
        XCTAssertTrue(union.intervals[0] == firstInterval)
        XCTAssertTrue(union.intervals[1] == secondInterval)
    }

    func testUnion4() {
        let firstInterval: Interval = -Double.infinity.><.0
        let secondInterval: Interval = -1.><.Double.infinity
        let union = firstInterval.formUnion(secondInterval)
        XCTAssertTrue(union.intervals.count == 1)
        XCTAssertTrue(union.intervals[0] == -Double.infinity.><.Double.infinity)
    }
}
