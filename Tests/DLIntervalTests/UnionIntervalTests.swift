//
//  UnionIntervalTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/25/17.
//

import XCTest
@testable import DLInterval

class UnionIntervalTests: XCTestCase {
    static var allTests = [
        ("testLowerBoundary", testLowerBoundary),
        ("testUpperBoundary", testUpperBoundary),
        ("testIsEmpty", testIsEmpty),
        ("testAppend", testAppend),
        ("testAppend2", testAppend2),
        ("testAppend3", testAppend3),
        ("testAppend4", testAppend4),
        ("testAppend5", testAppend5),
        ("testContains_forSuccess", testContains_forSuccess),
        ("testContains_forFailure", testContains_forFailure),
        ("testIntersection", testIntersection)
    ]

    func testLowerBoundary() {
        let unionInterval: UnionInterval = [0.><.1]
        XCTAssertTrue(unionInterval.lowerBoundary?.value == 0.0)
        XCTAssertTrue(unionInterval.lowerBoundary?.boundary.side == .left)
        XCTAssertTrue(unionInterval.lowerBoundary?.boundary.type == .open)
    }

    func testUpperBoundary() {
        let unionInterval: UnionInterval = [0.><.1]
        XCTAssertTrue(unionInterval.upperBoundary?.value == 1.0)
        XCTAssertTrue(unionInterval.upperBoundary?.boundary.side == .right)
        XCTAssertTrue(unionInterval.upperBoundary?.boundary.type == .open)
    }

    func testIsEmpty() {
        let unionInterval: UnionInterval = [0.><.1]
        XCTAssertTrue(unionInterval.isEmpty == false)
    }

    func testAppend() {
        var unionInterval: UnionInterval = [0.><.1]
        unionInterval.append(1.<.2)
        XCTAssertTrue(unionInterval.intervals.count == 1)
        XCTAssertTrue(unionInterval.upperBoundary?.value == 2.0)
        XCTAssertTrue(unionInterval.upperBoundary?.boundary.side == .right)
        XCTAssertTrue(unionInterval.upperBoundary?.boundary.type == .open)
    }

    func testAppend2() {
        var unionInterval: UnionInterval = []
        unionInterval.append([0..1])
        XCTAssertTrue(unionInterval.intervals.count == 1)
        XCTAssertTrue(unionInterval.upperBoundary?.value == 1.0)
        XCTAssertTrue(unionInterval.upperBoundary?.boundary.side == .right)
        XCTAssertTrue(unionInterval.upperBoundary?.boundary.type == .closed)
    }

    func testAppend3() {
        var unionInterval: UnionInterval = [-Double.infinity.><.(-1.0), 2.><.Double.infinity]
        unionInterval.append(-1.<.1)
        XCTAssertTrue(unionInterval.intervals.count == 2)
    }

    func testAppend4() {
        var unionInterval: UnionInterval = [-Double.infinity.><.(-5.0), 3.<.6]
        unionInterval.append([-5.<.(-2), 1.><.3, 7.><.Double.infinity])
        XCTAssertTrue(unionInterval.intervals.count == 3)
        XCTAssertTrue(unionInterval.intervals[0].upperBoundary.value == -2)
        XCTAssertTrue(unionInterval.intervals[1].lowerBoundary.value == 1)
    }

    func testAppend5() {
        var unionInterval: UnionInterval = [-Double.infinity.><.(-5.0), 3.<.6]
        unionInterval.append([-5.><.(-2), 1.><.3])
        XCTAssertTrue(unionInterval.intervals.count == 3)
        XCTAssertTrue(unionInterval.intervals[0].upperBoundary.value == -5)
        XCTAssertTrue(unionInterval.intervals[2].lowerBoundary.value == 1)
    }

    func testContains_forSuccess() {
        let unionInterval: UnionInterval = [-Double.infinity.>.1]
        XCTAssertTrue(unionInterval.contains(-1.0))
        XCTAssertTrue(unionInterval.contains(1.0))
    }

    func testContains_forFailure() {
        let unionInterval: UnionInterval = [-Double.infinity.><.1]
        XCTAssertFalse(unionInterval.contains(Double.infinity))
        XCTAssertFalse(unionInterval.contains(1.0))
    }

    func testIntersection() {
        let firstUnion: UnionInterval = [-Double.infinity.><.3]
        let secondUnion: UnionInterval = [2.><.Double.infinity]
        let intersection = firstUnion.intersection(secondUnion)
        XCTAssertTrue(intersection.intervals.count == 1)
        XCTAssertTrue(intersection.lowerBoundary?.value == 2)
        XCTAssertTrue(intersection.upperBoundary?.value == 3)
    }
}
