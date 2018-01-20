//
//  IntervalComparisonTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/25/17.
//

import XCTest
@testable import DLInterval

class IntervalComparisonTests: XCTestCase {
    static var allTests = [
        ("testComparison_forSuccess", testComparison_forSuccess),
        ("testComparison_forSuccess2", testComparison_forSuccess2),
        ("testComparison_forSuccess3", testComparison_forSuccess3)
    ]
    func testComparison_forSuccess() {
        let firstInterval: Interval = -Double.infinity.><.0
        let secondInterval: Interval = -10.><.0
        XCTAssertTrue(firstInterval < secondInterval)
    }

    func testComparison_forSuccess2() {
        let firstInterval: Interval = -0.<.1
        let secondInterval: Interval = -0.><.1
        XCTAssertTrue(firstInterval < secondInterval)
    }

    func testComparison_forSuccess3() {
        let firstInterval: Interval = -0.><.1
        let secondInterval: Interval = -0.>.1
        XCTAssertTrue(firstInterval < secondInterval)
    }
}
