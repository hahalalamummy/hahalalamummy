//
//  UIImageExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/6/16.
//  Copyright © 2016 SwifterSwift
//
import UIKit

// MARK: - Properties
public extension UIImage {
    
    /// SwifterSwift: Size in bytes of UIImage
    public var bytesSize: Int {
        return UIImageJPEGRepresentation(self, 1)?.count ?? 0
    }
    
    /// SwifterSwift: Size in kilo bytes of UIImage
    public var kilobytesSize: Int {
        return bytesSize / 1024
    }
    
    /// SwifterSwift: UIImage with .alwaysOriginal rendering mode.
    public var original: UIImage {
        return withRenderingMode(.alwaysOriginal)
    }
    
    /// SwifterSwift: UIImage with .alwaysTemplate rendering mode.
    public var template: UIImage {
        return withRenderingMode(.alwaysTemplate)
    }
    
}

// MARK: - Methods
public extension UIImage {
    
    /// SwifterSwift: Compressed UIImage from original UIImage.
    ///
    /// - Parameter quality: The quality of the resulting JPEG image, expressed as a value from 0.0 to 1.0. The value 0.0 represents the maximum compression (or lowest quality) while the value 1.0 represents the least compression (or best quality), (default is 0.5).
    /// - Returns: optional UIImage (if applicable).
    public func compressed(quality: CGFloat = 0.5) -> UIImage? {
        guard let data = compressedData(quality: quality) else {
            return nil
        }
        return UIImage(data: data)
    }
    
    /// SwifterSwift: Compressed UIImage data from original UIImage.
    ///
    /// - Parameter quality: The quality of the resulting JPEG image, expressed as a value from 0.0 to 1.0. The value 0.0 represents the maximum compression (or lowest quality) while the value 1.0 represents the least compression (or best quality), (default is 0.5).
    /// - Returns: optional Data (if applicable).
    private func compressedData(quality: CGFloat = 0.5) -> Data? {
        return UIImageJPEGRepresentation(self, quality)
    }
    
    /// SwifterSwift: UIImage Cropped to CGRect.
    ///
    /// - Parameter rect: CGRect to crop UIImage to.
    /// - Returns: cropped UIImage
    public func cropped(to rect: CGRect) -> UIImage {
        guard rect.size.width < size.width && rect.size.height < size.height else {
            return self
        }
        guard let image: CGImage = cgImage?.cropping(to: rect) else {
            return self
        }
        return UIImage(cgImage: image)
    }
    
    /// SwifterSwift: UIImage scaled to height with respect to aspect ratio.
    ///
    /// - Parameters:
    ///   - toHeight: new height.
    /// - Returns: optional scaled UIImage (if applicable).
    public func scaled(toHeight: CGFloat) -> UIImage? {
        let scale = toHeight / size.height
        let newWidth = size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: toHeight))
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: toHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// SwifterSwift: UIImage scaled to width with respect to aspect ratio.
    ///
    /// - Parameters:
    ///   - toWidth: new width.
    /// - Returns: optional scaled UIImage (if applicable).
    public func scaled(toWidth: CGFloat) -> UIImage? {
        let scale = toWidth / size.width
        let newHeight = size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: toWidth, height: newHeight))
        draw(in: CGRect(x: 0, y: 0, width: toWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    public func scaled(newWidth: CGFloat, newHeight: CGFloat) -> UIImage? { // cần test lại
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
