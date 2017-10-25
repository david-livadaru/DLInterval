//
//  IntervalIntersectionTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/25/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

import XCTest
@testable import DLInterval_iOS

class IntervalIntersectionTests: XCTestCase {
    func testIntersection_forSuccess() {
        let firstInterval = Interval([0..2])
        let secondInterval = Interval(1..<3)
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNotNil(intersection)
        XCTAssertTrue(intersection == [1..2])
    }

    func testIntersection_forSuccess2() {
        let firstInterval = Interval([0..2])
        let secondInterval = Interval((1..3))
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNotNil(intersection)
        XCTAssertTrue(intersection == 1.>.2)
    }

    func testIntersection_forSuccess3() {
        let firstInterval = Interval([3..5])
        let secondInterval = Interval((2..<4))
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNotNil(intersection)
        XCTAssertTrue(intersection == 3.<.4)
    }

    func testIntersection_forSuccess4() {
        let firstInterval: Interval = [1..2]
        let secondInterval: Interval = [2..3]
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNotNil(intersection)
        XCTAssertTrue(intersection == [2..2])
    }

    func testIntersection_forSuccess5() {
        let firstInterval: Interval = -Double.infinity.><.1
        let secondInterval: Interval = -1.><.Double.infinity
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNotNil(intersection)
        XCTAssertTrue(intersection == -1.><.1)
    }

    func testIntersection_forSuccess6() {
        let firstInterval: Interval = -1.><.1
        let secondInterval: Interval = -2.><.Double.infinity
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNotNil(intersection)
        XCTAssertTrue(intersection == -1.><.1)
    }

    func testIntersection_forSuccess7() {
        let firstInterval: Interval = -2.><.1
        let secondInterval: Interval = -1.><.Double.infinity
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNotNil(intersection)
        XCTAssertTrue(intersection == -1.><.1)
    }

    func testIntersection_forSuccess8() {
        let firstInterval: Interval = -Double.infinity.><.1
        let secondInterval: Interval = -1.><.5.0
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNotNil(intersection)
        XCTAssertTrue(intersection == -1.><.1)
    }

    func testIntersection_forFailure() {
        let firstInterval: Interval = 1.><.2
        let secondInterval: Interval = 2.>.3
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNil(intersection)
    }

    func testIntersection_forFailure2() {
        let firstInterval: Interval = 1.<.2
        let secondInterval: Interval = 2.<.3
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNil(intersection)
    }

    func testIntersection_forFailure3() {
        let firstInterval: Interval = 1.><.2
        let secondInterval: Interval = 2.><.3
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNil(intersection)
    }

    func testIntersection_forFailure4() {
        let firstInterval: Interval = -Double.infinity.><.0
        let secondInterval: Interval = 1.<.Double.infinity
        let intersection = firstInterval.intersection(with: secondInterval)
        XCTAssertNil(intersection)
    }
}
