// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTMarqueeLabelModel
struct DTMarqueeLabelModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let style: ComponentStyle?
  let text: Text?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case text
    case style
  }
  
  struct ComponentStyle: Codable, Hashable {
    let bgColor: String?
    
    enum CodingKeys: String, CodingKey {
      case bgColor = "bg_color"
    }
  }
  
  // MARK: - Text
  struct Text: Codable, Hashable {
    let style: Style?
    let value: String?
  }
  
  // MARK: - Style
  struct Style: Codable, Hashable {
    let textStyle, textColor, textAlignment: String?
    
    enum CodingKeys: String, CodingKey {
      case textStyle = "txt_style"
      case textColor = "txt_color"
      case textAlignment = "txt_align"
    }
  }
}
