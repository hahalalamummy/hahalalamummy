//
//  DoubleExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/6/16.
//  Copyright © 2016 SwifterSwift
//

import CoreGraphics

public extension Double {
    
    /// SwifterSwift: Int.
    public var int: Int {
        return Int(self)
    }
    
    /// SwifterSwift: Float.
    public var float: Float {
        return Float(self)
    }
    
    /// SwifterSwift: CGFloat.
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    public var string: String {
        return String(self)
    }
    
    /// SwifterSwift: Degree value of radian input
    public var radiansToDegrees: Double {
        return Double(self) * 180 / Double.pi
    }
    
}
