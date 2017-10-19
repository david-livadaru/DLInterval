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
        return intervals.count > 0
    }
    
    public typealias Element = Interval
    
    public init(arrayLiteral elements: Element...) {
        self.intervals = elements
        mergeIntervals()
    }
    
    public mutating func append(_ interval: Interval) {
        if let index = intervals.index(where: { interval > $0 }) {
            intervals.insert(interval, at: index)
        } else {
            intervals.append(interval)
        }
        mergeIntervals()
    }
    
    public func contains(_ element: Double) -> Bool {
        for interval in intervals {
            if interval.contains(element) {
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
        var newIntervals: [Interval] = []
        for index in 0..<intervals.count - 1 {
            let current = intervals[index]
            let next = intervals[index + 1]
            
            if canMerge(current, with: next) {
                newIntervals.append(merge(current, with: next))
            } else {
                newIntervals.append(contentsOf: [current, next])
            }
        }
        intervals = newIntervals
        if canMergeIntervals() {
            mergeIntervals()
        }
    }
    
    private func canMergeIntervals() -> Bool {
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
