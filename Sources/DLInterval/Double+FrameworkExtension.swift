//
//  Double+FrameworkExtension.swift
//  DLInterval
//
//  Created by David Livadaru on 1/15/18.
//  Copyright © 2018 David Livadaru. All rights reserved.
//

import Foundation

public extension Double {
    var step: Double {
        return pow(10, -15)
    }

    var next: Double {
        if self == Double.greatestFiniteMagnitude || self == -Double.greatestFiniteMagnitude {
            return self.nextUp
        }
        if self == Double.infinity || self == -Double.infinity {
            return self
        }

        return self + step
    }

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
