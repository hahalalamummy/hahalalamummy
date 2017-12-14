//
//  UIViewController.swift
//  hahalalamummy
//
//  Created by admin on 12/6/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

// MARK: - Properties
public extension UIViewController {
    
    /// SwifterSwift: Check if ViewController is onscreen and not hidden.
    public var isVisible: Bool {
        // http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
        return self.isViewLoaded && view.window != nil
    }
    
}
