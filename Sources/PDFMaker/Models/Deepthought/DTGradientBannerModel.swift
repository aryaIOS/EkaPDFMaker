// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTGradientBannerModel
struct DTGradientBannerModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let style: ComponentStyle?
  let text: Text?
  let icon: String?
  let cta: Cta?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case style, text, icon, cta
  }
  
  // MARK: - ComponentStyle
  struct ComponentStyle: Codable, Hashable {
    let bgColor, bgColor1: String?
    let elevated: Bool?
    
    enum CodingKeys: String, CodingKey {
      case bgColor = "bg_color"
      case bgColor1 = "bg_color_1"
      case elevated
    }
  }
  
  // MARK: - Text
  struct Text: Codable, Hashable {
    let style: TextStyle?
    let value: String?
  }
  
  // MARK: - TextStyle
  struct TextStyle: Codable, Hashable {
    let textStyle, textColor, textAlignment: String?
    
    enum CodingKeys: String, CodingKey {
      case textStyle = "txt_style"
      case textColor = "txt_color"
      case textAlignment = "txt_align"
    }
  }
}
