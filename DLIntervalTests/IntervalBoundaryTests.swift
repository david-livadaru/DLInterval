//
//  IntervalBoundaryTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/22/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

import XCTest
@testable import DLInterval_iOS

class IntervalBoundaryTests: XCTestCase {
    func testConstructor() {
        let intervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        XCTAssertTrue(intervalBoundary.value == 1.0)
        XCTAssertTrue(intervalBoundary.boundary.type == .open)
        XCTAssertTrue(intervalBoundary.boundary.side == .left)
    }

    func testContains_usingInfinity_forSuccess() {
        let intervalBoundary = IntervalBoundary(value: -Double.infinity, boundary: Boundary(type: .open, side: .left))
        XCTAssertTrue(intervalBoundary.contains(-Double.infinity))
        XCTAssertTrue(intervalBoundary.contains(Double.infinity))
    }

    func testContains_usingInfinity_forSuccess2() {
        let intervalBoundary = IntervalBoundary(value: -Double.infinity, boundary: Boundary(type: .closed, side: .left))
        XCTAssertTrue(intervalBoundary.contains(-Double.infinity))
        XCTAssertTrue(intervalBoundary.contains(Double.infinity))
    }

    func testContains_usingInfinity_forSuccess3() {
        let intervalBoundary = IntervalBoundary(value: -Double.infinity, boundary: Boundary(type: .open, side: .right))
        XCTAssertTrue(intervalBoundary.contains(-Double.infinity))
        XCTAssertTrue(intervalBoundary.contains(Double.infinity))
    }

    func testContains_usingInfinity_forSuccess4() {
        let intervalBoundary = IntervalBoundary(value: -Double.infinity,
                                                boundary: Boundary(type: .closed, side: .right))
        XCTAssertTrue(intervalBoundary.contains(-Double.infinity))
        XCTAssertTrue(intervalBoundary.contains(Double.infinity))
    }

    func testContains_usingValues_forSuccess() {
        let intervalLeftBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .left))
        XCTAssertTrue(intervalLeftBoundary.contains(0.0))
        XCTAssertTrue(intervalLeftBoundary.contains(1.0))
        XCTAssertTrue(intervalLeftBoundary.contains(Double.infinity))

        let intervalRightBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .right))
        XCTAssertTrue(intervalRightBoundary.contains(0.0))
        XCTAssertTrue(intervalRightBoundary.contains(-1.0))
        XCTAssertTrue(intervalRightBoundary.contains(-Double.infinity))
    }

    func testContains_usingValues_forFailure() {
        let intervalLeftBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .open, side: .left))
        XCTAssertFalse(intervalLeftBoundary.contains(0.0))
        XCTAssertFalse(intervalLeftBoundary.contains(-Double.infinity))

        let intervalRightBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertFalse(intervalRightBoundary.contains(0.0))
        XCTAssertFalse(intervalRightBoundary.contains(Double.infinity))
    }

    func testIntersects_forSuccess() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .left))
        XCTAssertTrue(firstIntervalBoundary.intersects(other: secondIntervalBoundary))
    }

    func testIntersects_forSuccess2() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .right))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertTrue(firstIntervalBoundary.intersects(other: secondIntervalBoundary))
    }

    func testIntersects_forSuccess3() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .left))
        XCTAssertTrue(firstIntervalBoundary.intersects(other: secondIntervalBoundary))
    }

    func testIntersects_forSuccess4() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertTrue(firstIntervalBoundary.intersects(other: secondIntervalBoundary))
    }

    func testIntersects_forSuccess5() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .closed, side: .right))
        XCTAssertTrue(firstIntervalBoundary.intersects(other: secondIntervalBoundary))
    }

    func testIntersects_forSuccess6() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertTrue(firstIntervalBoundary.intersects(other: secondIntervalBoundary, strictBoundaryTypeCheck: false))
    }

    func testIntersects_forFailure() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertFalse(firstIntervalBoundary.intersects(other: secondIntervalBoundary))
    }

    func testIntersects_forFailure2() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertFalse(firstIntervalBoundary.intersects(other: secondIntervalBoundary))
    }

    func testIntersects_forFailure3() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertFalse(firstIntervalBoundary.intersects(other: secondIntervalBoundary))
    }

    func testEquality_forSuccess() {
        let firstIntervalBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .left))
        XCTAssertTrue(firstIntervalBoundary == secondIntervalBoundary)
    }

    func testEquality_forFailure() {
        let firstIntervalBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .open, side: .left))
        XCTAssertFalse(firstIntervalBoundary == secondIntervalBoundary)
    }

    func testEquality_forFailure2() {
        let firstIntervalBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .left))
        XCTAssertFalse(firstIntervalBoundary == secondIntervalBoundary)
    }

    func testEquality_forFailure3() {
        let firstIntervalBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 0.0, boundary: Boundary(type: .closed, side: .right))
        XCTAssertFalse(firstIntervalBoundary == secondIntervalBoundary)
    }

    func testEquality_forFailure4() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .right))
        let secondIntervalBoundary = IntervalBoundary(value: 3.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertFalse(firstIntervalBoundary == secondIntervalBoundary)
    }

    func testComparison_forSuccess() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .closed, side: .right))
        XCTAssertTrue(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forSuccess2() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertTrue(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forSucces3() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .closed, side: .right))
        XCTAssertTrue(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forSuccess4() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertTrue(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forSuccess5() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .right))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .left))
        XCTAssertTrue(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forSuccess6() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .right))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .left))
        XCTAssertTrue(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forSuccess7() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .right))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        XCTAssertTrue(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forSuccess8() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .right))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        XCTAssertTrue(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forFailure() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .right))
        XCTAssertFalse(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forFailure2() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertFalse(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forFailure3() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .right))
        XCTAssertFalse(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forFailure4() {
        let firstIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertFalse(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forFailure5() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .closed, side: .right))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .left))
        XCTAssertFalse(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forFailure6() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .right))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .closed, side: .left))
        XCTAssertFalse(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forFailure7() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .closed, side: .right))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .left))
        XCTAssertFalse(firstIntervalBoundary < secondIntervalBoundary)
    }

    func testComparison_forFailure8() {
        let firstIntervalBoundary = IntervalBoundary(value: 2.0, boundary: Boundary(type: .open, side: .left))
        let secondIntervalBoundary = IntervalBoundary(value: 1.0, boundary: Boundary(type: .open, side: .right))
        XCTAssertFalse(firstIntervalBoundary < secondIntervalBoundary)
    }
}
