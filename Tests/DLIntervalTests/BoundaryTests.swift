//
//  BoundaryTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/20/17.
//

import XCTest
@testable import DLInterval

class BoundaryTests: XCTestCase {
    static var allTests = [
        ("testConstructor_left_open", testConstructor_left_open),
        ("testEquality_forSuccess", testEquality_forSuccess),
        ("testEquality_forFailure", testEquality_forFailure),
        ("testComparison_forSuccess", testComparison_forSuccess),
        ("testComparison_forSuccess2", testComparison_forSuccess2),
        ("testComparison_forSuccess3", testComparison_forSuccess3),
        ("testComparison_forSuccess4", testComparison_forSuccess4),
        ("testComparison_forSuccess5", testComparison_forSuccess5),
        ("testComparison_forSuccess6", testComparison_forSuccess6),
        ("testComparison_forFailure", testComparison_forFailure),
        ("testComparison_forFailure2", testComparison_forFailure2),
        ("testComparison_forFailure3", testComparison_forFailure3),
        ("testComparison_forFailure4", testComparison_forFailure4),
        ("testComparison_forFailure5", testComparison_forFailure5),
        ("testComparison_forFailure6", testComparison_forFailure6),
        ("testComparison_ofEqualBoundary_forFailure", testComparison_ofEqualBoundary_forFailure),
        ("testComparison_ofEqualBoundary_forFailure2", testComparison_ofEqualBoundary_forFailure2),
        ("testComparison_ofEqualBoundary_forFailure3", testComparison_ofEqualBoundary_forFailure3),
        ("testComparison_ofEqualBoundary_forFailure4", testComparison_ofEqualBoundary_forFailure4)
    ]

    func testConstructor_left_open() {
        let boundary = Boundary(type: .open, side: .left)
        XCTAssertTrue(boundary.type == .open)
        XCTAssertTrue(boundary.side == .left)
    }

    func testEquality_forSuccess() {
        let firstBoundary = Boundary(type: .open, side: .left)
        let secondBoundary = Boundary(type: .open, side: .left)
        XCTAssertTrue(firstBoundary == secondBoundary)
    }

    func testEquality_forFailure() {
        let firstBoundary = Boundary(type: .open, side: .left)
        let secondBoundary = Boundary(type: .closed, side: .left)
        XCTAssertFalse(firstBoundary == secondBoundary)
    }

    func testComparison_forSuccess() {
        let firstBoundary = Boundary(type: .open, side: .right)
        let secondBoundary = Boundary(type: .closed, side: .right)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forSuccess2() {
        let firstBoundary = Boundary(type: .open, side: .right)
        let secondBoundary = Boundary(type: .closed, side: .left)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forSuccess3() {
        let firstBoundary = Boundary(type: .open, side: .right)
        let secondBoundary = Boundary(type: .open, side: .left)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forSuccess4() {
        let firstBoundary = Boundary(type: .closed, side: .right)
        let secondBoundary = Boundary(type: .closed, side: .left)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forSuccess5() {
        let firstBoundary = Boundary(type: .closed, side: .right)
        let secondBoundary = Boundary(type: .open, side: .left)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forSuccess6() {
        let firstBoundary = Boundary(type: .closed, side: .left)
        let secondBoundary = Boundary(type: .open, side: .left)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forFailure() {
        let firstBoundary = Boundary(type: .closed, side: .right)
        let secondBoundary = Boundary(type: .open, side: .right)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_forFailure2() {
        let firstBoundary = Boundary(type: .closed, side: .left)
        let secondBoundary = Boundary(type: .closed, side: .right)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_forFailure3() {
        let firstBoundary = Boundary(type: .closed, side: .left)
        let secondBoundary = Boundary(type: .open, side: .right)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_forFailure4() {
        let firstBoundary = Boundary(type: .open, side: .left)
        let secondBoundary = Boundary(type: .open, side: .right)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_forFailure5() {
        let firstBoundary = Boundary(type: .open, side: .left)
        let secondBoundary = Boundary(type: .closed, side: .right)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_forFailure6() {
        let firstBoundary = Boundary(type: .open, side: .left)
        let secondBoundary = Boundary(type: .closed, side: .left)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_ofEqualBoundary_forFailure() {
        let firstBoundary = Boundary(type: .open, side: .left)
        let secondBoundary = Boundary(type: .open, side: .left)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_ofEqualBoundary_forFailure2() {
        let firstBoundary = Boundary(type: .closed, side: .left)
        let secondBoundary = Boundary(type: .closed, side: .left)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_ofEqualBoundary_forFailure3() {
        let firstBoundary = Boundary(type: .open, side: .right)
        let secondBoundary = Boundary(type: .open, side: .right)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_ofEqualBoundary_forFailure4() {
        let firstBoundary = Boundary(type: .closed, side: .right)
        let secondBoundary = Boundary(type: .closed, side: .right)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }
}
