//
//  Double+FrameworkExtension.swift
//  DLInterval
//
//  Created by David Livadaru on 1/15/18.
//

import Foundation

public extension Double {
    /// The ammount used to compute **next** and **previous** values.
    var step: Double {
        return pow(10, -15)
    }

    /// The smallest values greater than self.
    var next: Double {
        if self == Double.greatestFiniteMagnitude || self == -Double.greatestFiniteMagnitude {
            return self.nextUp
        }
        if self == Double.infinity || self == -Double.infinity {
            return self
        }

        return self + step
    }

    /// The smallest values less than self.
    var previous: Double {
        if self == Double.greatestFiniteMagnitude || self == -Double.greatestFiniteMagnitude {
            return self.nextDown
        }
        if self == Double.infinity || self == -Double.infinity {
            return self
        }

        return self - step
    }
}
