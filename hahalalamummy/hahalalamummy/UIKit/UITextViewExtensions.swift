//
//  UITextViewExtensions.swift
//  hahalalamummy
//
//  Created by admin on 12/6/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

public extension UITextView {
    
    /// SwifterSwift: Scroll to the bottom of text view
    public func scrollToBottom() {
        let range = NSMakeRange((text as NSString).length - 1, 1)
        scrollRangeToVisible(range)
        
    }
    
    /// SwifterSwift: Scroll to the top of text view
    public func scrollToTop() {
        let range = NSMakeRange(0, 1)
        scrollRangeToVisible(range)
    }
    
}
