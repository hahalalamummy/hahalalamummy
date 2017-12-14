//
//  hahalalamummy.swift
//  hahalalamummy
//
//  Created by admin on 12/3/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import SystemConfiguration.CaptiveNetwork
import CoreTelephony

// MARK: - App
public class hahalalamummy {
    
    public static var appDisplayName: String? {
        // http://stackoverflow.com/questions/28254377/get-app-name-in-swift
        return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
    }
    
    public static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    
    public static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    public static var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public static var appBadgeNumber: Int { // cần test lại
        get {
            return UIApplication.shared.applicationIconBadgeNumber
        }
        set {
            //UIApplication.shared.registerForRemoteNotifications()
            UIApplication.shared.applicationIconBadgeNumber = newValue
        }
    }
    
}

// MARK: - Device
public extension hahalalamummy {
    
    // Status bar: thanh nằm trên navigation, chứa pin, time, vạch sóng
    public static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public static var isiPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    public static var isiPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    public static var wifiName: String? {
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    return interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                }
            }
        }
        return ""
    }
    
    public static var carrierName: String? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider
        return carrier?.carrierName
    }
    
}

// MARK: - Notification
public extension hahalalamummy {
    
    public static func didTakeScreenShot(_ action: @escaping (_ notification: Notification) -> Void) {
        // http://stackoverflow.com/questions/13484516/ios-detection-of-screenshot
        NotificationCenter.default.addObserver(forName: Notification.Name.UIApplicationUserDidTakeScreenshot, object: nil, queue: OperationQueue.main) { notification in
            action(notification)
        }
    }
    
    public static func didReceiveMemoryWarning(_ action: @escaping (_ notification: Notification) -> Void) {
        NotificationCenter.default.addObserver(forName: Notification.Name.UIApplicationDidReceiveMemoryWarning, object: nil, queue: OperationQueue.main) { notification in
            action(notification)
        }
    }
    
    public static func keyboardDidShow(_ action: @escaping (_ notification: Notification) -> Void) {
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardDidShow, object: nil, queue: OperationQueue.main) { notification in
            action(notification)
        }
    }
    
}

// MARK: - Methods
public extension hahalalamummy {
    
    /// SwifterSwift: Distance between two CGPoints.
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let distance = hahalalamummy.distanceBetweenTwoPoint(from: point2, to: point1)
    ///     //Distance = 28.28
    ///
    /// - Parameters:
    ///   - point1: first CGPoint.
    ///   - point2: second CGPoint.
    /// - Returns: distance between the two given CGPoints.
    public static func distanceBetweenTwoPoint(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        // http://stackoverflow.com/questions/6416101/calculate-the-distance-between-two-cgpoints
        return CGPoint.distance(from: point1, to: point2)
    }
    
    public static func randomInteger(between min: Int, and max: Int) -> Int {
        return Int.random(inRange: min...max)
    }
    
    public static func romanNumeral(number: Int) -> String? {
        return number.romanNumeral()
    }
    
    public static func isPrime(number: Int) -> Bool {
        return number.isPrime()
    }
    
    public static func copyToPasteboard(text: Any) {
        UIPasteboard.general.string = text as? String
    }
    
    public static func countryName(countryCode: String) -> String? {
        let current = Locale(identifier: "en_US")
        return current.localizedString(forRegionCode: countryCode) ?? ""
    }
    
    public static func countryCode(countryName: String) -> String? {
        for code in NSLocale.isoCountryCodes {
            let name = NSLocale(localeIdentifier: "en_US").displayName(forKey: NSLocale.Key.countryCode, value: code)
            if (name == countryName) {
                return name
            }
        }
        return ""
    }
    
    public static func timeSince(from: NSDate, numericDates: Bool = false) -> String {
        let calendar = Calendar.current
        let now = NSDate()
        let earliest = now.earlierDate(from as Date)
        let latest = earliest == now as Date ? from : now
        let components = calendar.dateComponents([.year, .weekOfYear, .month, .day, .hour, .minute, .second], from: earliest, to: latest as Date)
        
        var result = ""
        
        if components.year! >= 2 {
            result = "\(components.year!) years ago"
        } else if components.year! >= 1 {
            if numericDates {
                result = "1 year ago"
            } else {
                result = "Last year"
            }
        } else if components.month! >= 2 {
            result = "\(components.month!) months ago"
        } else if components.month! >= 1 {
            if numericDates {
                result = "1 month ago"
            } else {
                result = "Last month"
            }
        } else if components.weekOfYear! >= 2 {
            result = "\(components.weekOfYear!) weeks ago"
        } else if components.weekOfYear! >= 1 {
            if numericDates {
                result = "1 week ago"
            } else {
                result = "Last week"
            }
        } else if components.day! >= 2 {
            result = "\(components.day!) days ago"
        } else if components.day! >= 1 {
            if numericDates {
                result = "1 day ago"
            } else {
                result = "Yesterday"
            }
        } else if components.hour! >= 2 {
            result = "\(components.hour!) hours ago"
        } else if components.hour! >= 1 {
            if numericDates {
                result = "1 hour ago"
            } else {
                result = "An hour ago"
            }
        } else if components.minute! >= 2 {
            result = "\(components.minute!) minutes ago"
        } else if components.minute! >= 1 {
            if numericDates {
                result = "1 minute ago"
            } else {
                result = "A minute ago"
            }
        } else if components.second! >= 3 {
            result = "\(components.second!) seconds ago"
        } else {
            result = "Just now"
        }
        
        return result
    }
    
    public static var topViewController: UIViewController? {
        var topViewController = UIApplication.shared.keyWindow?.rootViewController
        while ((topViewController?.presentedViewController) != nil) {
            topViewController = topViewController?.presentedViewController
        }
        return topViewController
    }
    
}
