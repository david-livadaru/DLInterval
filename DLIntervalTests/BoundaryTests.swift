//
//  BoundaryTests.swift
//  DLInterval_iOSTests
//
//  Created by David Livadaru on 10/20/17.
//

import XCTest
@testable import DLInterval_iOS

class BoundaryTests: XCTestCase {
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

    func testComparison_forSucess2() {
        let firstBoundary = Boundary(type: .open, side: .right)
        let secondBoundary = Boundary(type: .closed, side: .left)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forSucess3() {
        let firstBoundary = Boundary(type: .open, side: .right)
        let secondBoundary = Boundary(type: .open, side: .left)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forSucess4() {
        let firstBoundary = Boundary(type: .closed, side: .right)
        let secondBoundary = Boundary(type: .closed, side: .left)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forSucess5() {
        let firstBoundary = Boundary(type: .closed, side: .right)
        let secondBoundary = Boundary(type: .open, side: .left)
        XCTAssertTrue(firstBoundary < secondBoundary)
    }

    func testComparison_forSucess6() {
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

    func testComparison_ofEqualBoundary_forFailur3() {
        let firstBoundary = Boundary(type: .open, side: .right)
        let secondBoundary = Boundary(type: .open, side: .right)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }

    func testComparison_ofEqualBoundary_forFailur4() {
        let firstBoundary = Boundary(type: .closed, side: .right)
        let secondBoundary = Boundary(type: .closed, side: .right)
        XCTAssertFalse(firstBoundary < secondBoundary)
    }
}
