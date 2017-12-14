//
//  UICollectionViewExtensions.swift
//  hahalalamummy
//
//  Created by admin on 12/5/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

public extension UICollectionView {
    public func reloadData(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion()
        })
    }
}
