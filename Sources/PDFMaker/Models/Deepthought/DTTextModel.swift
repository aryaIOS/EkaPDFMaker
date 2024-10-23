// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation
import EkaUI
import UIKit

// MARK: - DTTextModel
struct DTTextModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let text: Text?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case text
  }
  
  // MARK: - Text
  struct Text: Codable, Hashable {
    let style: DTTextStyle?
    let value: String?
    
    var homeCardValue: String {
      var res = ""
      value?.components(separatedBy: "\\n").forEach({
        res += $0 + "\n"
      })
      return res.count > 1 ? String(res.dropLast()) : res
    }
    
    var itemTextStyle: TextStyle {
      return .init(
        ekaFont: DeepThoughtFontType(rawValue: style?.textStyle ?? "")?.systemFont ?? .body1Regular,
        uiColor: UIColor(hexString: style?.textColor) ?? .text01
      )
    }
  }
}
