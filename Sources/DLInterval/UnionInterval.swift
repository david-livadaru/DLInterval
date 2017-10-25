//
//  UnionInterval.swift
//  DLInterval
//
//  Created by David Livadaru on 3/13/17.
//

import Foundation

public struct UnionInterval: IntervalType, ExpressibleByArrayLiteral {
    public private (set) var intervals: [Interval]
    
    public var lowerBoundary: IntervalBoundary? {
        return intervals.first?.lowerBoundary
    }
    
    public var upperBoundary: IntervalBoundary? {
        return intervals.last?.upperBoundary
    }
    
    public var isEmpty: Bool {
        return intervals.count == 0
    }
    
    public typealias Element = Interval
    
    public init(arrayLiteral elements: Element...) {
        self.intervals = elements
        mergeIntervals()
    }
    
    public mutating func append(_ interval: Interval) {
        append([interval])
    }

    public mutating func append(_ union: UnionInterval) {
        for interval in union.intervals {
            if let index = intervals.index(where: { $0 > interval }) {
                intervals.insert(interval, at: index)
            } else {
                intervals.append(interval)
            }
        }
        mergeIntervals()
    }
    
    public func contains(_ value: Double) -> Bool {
        for interval in intervals {
            if interval.contains(value) {
                return true
            }
        }
        return false
    }
    
    public func intersection(_ union: UnionInterval) -> UnionInterval {
        var newUnion = UnionInterval()
        for selfInterval in intervals {
            for unionInterval in union.intervals {
                if let intersection = selfInterval.intersection(with: unionInterval) {
                    newUnion.append(intersection)
                }
            }
        }
        newUnion.mergeIntervals()
        return newUnion
    }
    
    // MARK: Private functionality
    
    private mutating func mergeIntervals() {
        guard canMergeIntervals() else { return }
        var newIntervals: [Interval] = []
        var index = 0
        while index < intervals.count - 1 {
            let current = intervals[index]
            let next = intervals[index + 1]

            if canMerge(current, with: next) {
                newIntervals.append(merge(current, with: next))
            } else {
                newIntervals.append(contentsOf: [current, next])
            }
            index += 2
        }
        if intervals.count % 2 == 1, let lastInterval = intervals.last {
            newIntervals.append(lastInterval)
        }
        intervals = newIntervals
        mergeIntervals()
    }
    
    private func canMergeIntervals() -> Bool {
        guard intervals.count >= 2 else { return false }
        for index in 0..<intervals.count - 1 {
            let current = intervals[index]
            let next = intervals[index + 1]
            if canMerge(current, with: next) {
                return true
            }
        }
        return false
    }
    
    private func canMerge(_ first: Interval, with second: Interval) -> Bool {
        if first.upperBoundary > second.lowerBoundary {
            return true
        }
        
        if first.upperBoundary.value == second.lowerBoundary.value &&
           (first.upperBoundary.boundary.type == .closed ||
            second.lowerBoundary.boundary.type == .closed) {
            return true
        }
        
        return false
    }
    
    private func merge(_ first: Interval, with second: Interval) -> Interval {
        return Interval(lowerBoundary: first.lowerBoundary, upperBoundary: second.upperBoundary)
    }
}
