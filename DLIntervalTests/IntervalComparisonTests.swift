//
//  IntervalComparisonTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/25/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

import XCTest
@testable import DLInterval_iOS

class IntervalComparisonTests: XCTestCase {
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
