//
//  IntervalConstructorTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/25/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

import XCTest
@testable import DLInterval_iOS

class IntervalConstructorTests: XCTestCase {
    func testConstructor_forSuccess() {
        let lowerInterval = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .left))
        let upperInterval = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .right))
        _ = Interval(lowerBoundary: lowerInterval, upperBoundary: upperInterval)
    }

    func testConstructor_forSuccess2() {
        let lowerInterval = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .left))
        let upperInterval = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .right))
        _ = Interval(lowerBoundary: lowerInterval, upperBoundary: upperInterval)
    }

    func testConstructor_forSuccess3() {
        let lowerInterval = IntervalBoundary(value: -Double.infinity, boundary: Boundary(type: .open, side: .left))
        let upperInterval = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .right))
        _ = Interval(lowerBoundary: lowerInterval, upperBoundary: upperInterval)
    }

    func testConstructor_forSuccess4() {
        let lowerInterval = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .left))
        let upperInterval = IntervalBoundary(value: Double.infinity, boundary: Boundary(type: .open, side: .right))
        _ = Interval(lowerBoundary: lowerInterval, upperBoundary: upperInterval)
    }

    func testConstructor_forSuccess5() {
        let lowerInterval = IntervalBoundary(value: -Double.infinity, boundary: Boundary(type: .open, side: .left))
        let upperInterval = IntervalBoundary(value: Double.infinity, boundary: Boundary(type: .open, side: .right))
        _ = Interval(lowerBoundary: lowerInterval, upperBoundary: upperInterval)
    }

    func testArrayConstructor() {
        let interval: Interval = [0..0]
        XCTAssertTrue(interval.lowerBoundary.boundary.side == .left)
        XCTAssertTrue(interval.lowerBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.lowerBoundary.value == 0.0)

        XCTAssertTrue(interval.upperBoundary.boundary.side == .right)
        XCTAssertTrue(interval.upperBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.upperBoundary.value == 0.0)
    }

    func testArrayConstructor2() {
        let interval = Interval([0..0])
        XCTAssertTrue(interval.lowerBoundary.boundary.side == .left)
        XCTAssertTrue(interval.lowerBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.lowerBoundary.value == 0.0)

        XCTAssertTrue(interval.upperBoundary.boundary.side == .right)
        XCTAssertTrue(interval.upperBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.upperBoundary.value == 0.0)
    }

    func testArrayConstructor3() {
        let interval = Interval([0.0, 1.0])
        XCTAssertTrue(interval.lowerBoundary.boundary.side == .left)
        XCTAssertTrue(interval.lowerBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.lowerBoundary.value == 0.0)

        XCTAssertTrue(interval.upperBoundary.boundary.side == .right)
        XCTAssertTrue(interval.upperBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.upperBoundary.value == 1.0)
    }

    func testArrayConstructor4() {
        let interval = Interval([0.0, 1.0, 2.0, 3.0])
        XCTAssertTrue(interval.lowerBoundary.boundary.side == .left)
        XCTAssertTrue(interval.lowerBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.lowerBoundary.value == 0.0)

        XCTAssertTrue(interval.upperBoundary.boundary.side == .right)
        XCTAssertTrue(interval.upperBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.upperBoundary.value == 1.0)
    }

    func testTupleConstructor() {
        let interval = Interval((0.0, 1.0))
        XCTAssertTrue(interval.lowerBoundary.boundary.side == .left)
        XCTAssertTrue(interval.lowerBoundary.boundary.type == .open)
        XCTAssertTrue(interval.lowerBoundary.value == 0.0)

        XCTAssertTrue(interval.upperBoundary.boundary.side == .right)
        XCTAssertTrue(interval.upperBoundary.boundary.type == .open)
        XCTAssertTrue(interval.upperBoundary.value == 1.0)
    }

    func testArrayConstructor2_() {
        let interval = Interval((0..1))
        XCTAssertTrue(interval.lowerBoundary.boundary.side == .left)
        XCTAssertTrue(interval.lowerBoundary.boundary.type == .open)
        XCTAssertTrue(interval.lowerBoundary.value == 0.0)

        XCTAssertTrue(interval.upperBoundary.boundary.side == .right)
        XCTAssertTrue(interval.upperBoundary.boundary.type == .open)
        XCTAssertTrue(interval.upperBoundary.value == 1.0)
    }

    func testTupleConstructor2() {
        let interval = Interval(0.0...1.0)
        XCTAssertTrue(interval.lowerBoundary.boundary.side == .left)
        XCTAssertTrue(interval.lowerBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.lowerBoundary.value == 0.0)

        XCTAssertTrue(interval.upperBoundary.boundary.side == .right)
        XCTAssertTrue(interval.upperBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.upperBoundary.value == 1.0)
    }

    func testRangeConstructor() {
        let interval = Interval(0.0..<1.0)
        XCTAssertTrue(interval.lowerBoundary.boundary.side == .left)
        XCTAssertTrue(interval.lowerBoundary.boundary.type == .closed)
        XCTAssertTrue(interval.lowerBoundary.value == 0.0)

        XCTAssertTrue(interval.upperBoundary.boundary.side == .right)
        XCTAssertTrue(interval.upperBoundary.boundary.type == .open)
        XCTAssertTrue(interval.upperBoundary.value == 1.0)
    }

    func testArrayLiteralArray() {
        let interval: Interval = [0..1, 1..2, 2..3]
        XCTAssertTrue(interval.lowerBoundary.value == 0.0)
        XCTAssertTrue(interval.upperBoundary.value == 1.0)
    }
}
