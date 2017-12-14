//
//  CharacterExtensions.swift
//  hahalalamummy
//
//  Created by admin on 12/6/17.
//  Copyright © 2017 admin. All rights reserved.
//

public extension Character {
    
    /// SwifterSwift: Integer from character (if applicable).
    ///
    ///        Character("1").int -> 1
    ///        Character("A").int -> nil
    ///
    public var int: Int? {
        return Int(String(self))
    }
    
    /// SwifterSwift: String from character.
    ///
    ///        Character("a").string -> "a"
    ///
    public var string: String {
        return String(self)
    }
    
    /// SwifterSwift: Return the character lowercased.
    ///
    ///        Character("A").lowercased -> Character("a")
    ///
    public var lowercased: Character {
        return String(self).lowercased().first!
    }
    
    /// SwifterSwift: Return the character uppercased.
    ///
    ///        Character("a").uppercased -> Character("A")
    ///
    public var uppercased: Character {
        return String(self).uppercased().first!
    }
    
    public var asciiValue: Int? {
        //return self.string.asciiArray.first
        return self.string.unicodeScalars.filter{$0.isASCII}.first?.value.int
    }

}

private extension UInt32 {
    var int: Int {
        return Int(self)
    }
}
