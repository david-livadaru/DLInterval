import XCTest
@testable import DLIntervalTests

XCTMain([
    testCase(BoundaryTests.allTests),
    testCase(IntervalBoundaryTests.allTests),
    testCase(IntervalClipValueTests.allTests),
    testCase(IntervalComparisonTests.allTests),
    testCase(IntervalConstructorTests.allTests),
    testCase(IntervalContainsTests.allTests),
    testCase(IntervalIntersectionTests.allTests),
    testCase(IntervalUnionTests.allTests),
    testCase(UnionIntervalTests,allTests)
])
