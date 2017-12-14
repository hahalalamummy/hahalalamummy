//
//  StringExtensions.swift
//  hahalalamummy
//
//  Created by admin on 12/5/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

public extension String {
    
    /// SwifterSwift: Check if string contains one or more emojis.
    ///
    ///        "Hello 😀".containEmoji -> true
    ///
    public var containEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9, // Special Characters
            0x1D000...0x1F77F, // Emoticons
            0x2100...0x27BF, // Misc symbols and Dingbats
            0xFE00...0xFE0F, // Variation Selectors
            0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
    }
    
    
    /// SwifterSwift: Check if string is valid email format.
    ///
    ///        "john@doe.com".isEmail -> true
    ///
    public var isEmail: Bool {
        // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        return (range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                      options: String.CompareOptions.regularExpression,
                      range: nil, locale: nil) != nil)
    }
    
    /// SwifterSwift: Check if string is a valid URL.
    ///
    ///        "https://google.com".isValidUrl -> true
    ///
    public var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    
    /// SwifterSwift: Integer value from string (if applicable).
    ///
    ///        "101".int -> 101
    ///
    public var int: Int? {
        return Int(self)
    }
    
    public var float: Float? {
        return Float(self)
    }
    
    public var double: Double? {
        return Double(self)
    }
    
    public var cgFloat: CGFloat? {
        return NumberFormatter().number(from: self) as? CGFloat
    }
    
    /// SwifterSwift: URL from string (if applicable).
    ///
    ///        "https://google.com".url -> URL(string: "https://google.com")
    ///        "not url".url -> nil
    ///
    public var url: URL? {
        return URL(string: self)
    }
    
    public var asciiArray: [Int] {
        return unicodeScalars.filter{$0.isASCII}.map{Int($0.value)}
    }
    
}

// MARK: - Methods
public extension String {
    
    public func date(dateFormat: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.date(from: self)
    }
    
    func smartContains(_ text: String) -> Bool {
        let array : [String] = text.lowercased().components(separatedBy: " ").filter { !$0.isEmpty }
        return array.reduce(true) { !$0 ? false : (self.lowercased().range(of: $1) != nil ) }
    }
    
}

// MARK: - NSAttributedString extensions
public extension String {
    
    /// SwifterSwift: Bold string.
    ///
    public var bold: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// SwifterSwift: Underlined string
    ///
    public var underline: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
    }
    
    /// SwifterSwift: Strikethrough string.
    ///
    public var strikethrough: NSAttributedString { // gạch ngang
        return NSAttributedString(string: self, attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue as Int)])
    }
    
    /// SwifterSwift: Italic string.
    ///
    public var italic: NSAttributedString { // chữ nghiêng
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// SwifterSwift: Add color to string.
    ///
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString versions of string colored with given color.
    public func colored(with color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color])
    }
    
}
