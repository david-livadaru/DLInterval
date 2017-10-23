//
//  IntervalTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/22/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

import XCTest
@testable import DLInterval_iOS

class IntervalTests: XCTestCase {
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
