//
//  ViewController.swift
//  hahalalamummy
//
//  Created by admin on 12/3/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let application = UIApplication.shared
//        if #available(iOS 10.0, *) {
//            let center = UNUserNotificationCenter.current()
//            center.requestAuthorization(options: [.badge, .alert, .sound]) { _, _ in }
//        } else {
//            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
//        }
//        application.registerForRemoteNotifications()
//        application.applicationIconBadgeNumber = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

