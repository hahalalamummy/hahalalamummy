//
//  FloatExtensions.swift
//  hahalalamummy
//
//  Created by admin on 12/6/17.
//  Copyright © 2017 admin. All rights reserved.
//

import CoreGraphics

public extension Float {
    
    /// SwifterSwift: Int.
    public var int: Int {
        return Int(self)
    }
    
    /// SwifterSwift: Double.
    public var double: Double {
        return Double(self)
    }
    
    /// SwifterSwift: CGFloat.
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    public var string: String {
        return String(self)
    }
    
    
    /// SwifterSwift: Degree value of radian input
    public var radiansToDegrees: Float {
        return Float(self) * 180 / Float.pi
    }
    
}
