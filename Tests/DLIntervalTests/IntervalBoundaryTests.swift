//
//  IntervalBoundaryTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/22/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

import XCTest
@testable import DLInterval

class IntervalBoundaryTests: XCTestCase {
    static var allTests = [
        ("testConstructor", testConstructor),
        ("testContains_usingInfinity_forSuccess", testContains_usingInfinity_forSuccess),
        ("testContains_usingInfinity_forSuccess2", testContains_usingInfinity_forSuccess2),
        ("testContains_usingInfinity_forSuccess3", testContains_usingInfinity_forSuccess3),
        ("testContains_usingInfinity_forSuccess4", testContains_usingInfinity_forSuccess4),
        ("testContains_usingValues_forSuccess", testContains_usingValues_forSuccess),
        ("testContains_usingValues_forFailure", testContains_usingValues_forFailure),
        ("testIntersects_forSuccess", testIntersects_forSuccess),
        ("testIntersects_forSuccess2", testIntersects_forSuccess2),
        ("testIntersects_forSuccess3", testIntersects_forSuccess3),
        ("testIntersects_forSuccess4", testIntersects_forSuccess4),
        ("testIntersects_forSuccess5", testIntersects_forSuccess5),
        ("testIntersects_forSuccess6", testIntersects_forSuccess6),
        ("testIntersects_forFailure", testIntersects_forFailure),
        ("testIntersects_forFailure2", testIntersects_forFailure2),
        ("testIntersects_forFailure3", testIntersects_forFailure3),
        ("testEquality_forSuccess", testEquality_forSuccess),
        ("testEquality_forFailure", testEquality_forFailure),
        ("testEquality_forFailure2", testEquality_forFailure2),
        ("testEquality_forFailure3", testEquality_forFailure3),
        ("testEquality_forFailure4", testEquality_forFailure4),
        ("testComparison_forSuccess", testComparison_forSuccess),
        ("testComparison_forSuccess2", testComparison_forSuccess2),
        ("testComparison_forSuccess3", testComparison_forSuccess3),
        ("testComparison_forSuccess4", testComparison_forSuccess4),
        ("testComparison_forSuccess5", testComparison_forSuccess5),
        ("testComparison_forSuccess6", testComparison_forSuccess6),
        ("testComparison_forSuccess7", testComparison_forSuccess7),
        ("testComparison_forSuccess8", testComparison_forSuccess8),
        ("testComparison_forFailure", testComparison_forFailure),
        ("testComparison_forFailure2", testComparison_forFailure2),
        ("testComparison_forFailure3", testComparison_forFailure3),
        ("testComparison_forFailure4", testComparison_forFailure4),
        ("testComparison_forFailure5", testComparison_forFailure5),
        ("testComparison_forFailure6", testComparison_forFailure6),
        ("testComparison_forFailure7", testComparison_forFailure7),
        ("testComparison_forFailure8", testComparison_forFailure8)
    ]

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

    func testComparison_forSuccess3() {
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
