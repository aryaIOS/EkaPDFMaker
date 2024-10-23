//
//  UIColor+Extensions.swift
//  EkaPDFGenerator
//
//  Created by Arya Vashisht on 23/10/24.
//

import UIKit.UIColor

extension UIColor {
  
  convenience init?(hexString: String?) {
    guard let hexString = hexString else {
      return nil
    }
    
    var r: CGFloat = 0.0
    var g: CGFloat = 0.0
    var b: CGFloat = 0.0
    var a: CGFloat = 1.0
    
    if hexString.hasPrefix("#") {
      let start = hexString.index(hexString.startIndex, offsetBy: 1)
      let hexColor = String(hexString[start...])
      
      let scanner = Scanner(string: hexColor)
      var hexNumber: UInt64 = 0
      
      if scanner.scanHexInt64(&hexNumber) {
        if hexColor.count == 6 {
          r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
          g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
          b = CGFloat(hexNumber & 0x0000FF) / 255.0
        }
        
        if hexColor.count == 8 {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
        return
      }
    }
    return nil
  }
  
  var hexString: String {
    let components = self.cgColor.components
    let r = components?[0] ?? 0.0
    let g = components?[1] ?? 0.0
    let b = components?[2] ?? 0.0
    return String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
  }
  
}
