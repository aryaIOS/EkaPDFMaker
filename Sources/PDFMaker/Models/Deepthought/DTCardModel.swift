// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTCardModel
struct DTCardModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let cardIcon, rightIcon: String?
  let items: [Item]?
  let cta: Cta?
  let style: ComponentStyle?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case cardIcon = "card_icon"
    case rightIcon = "right_icon"
    case items, cta, style
  }
  
  // MARK: - Item
  struct Item: Codable, Hashable {
    let icon: String?
    let text: Text?
  }
  
  // MARK: - Text
  struct Text: Codable, Hashable {
    let style: DTTextStyle?
    let value: String?
  }
  
  // MARK: - ComponentStyle
  struct ComponentStyle: Codable, Hashable {
    let elevated: Bool?
  }
}

// MARK: - TextStyle
struct DTTextStyle: Codable, Hashable {
  let textStyle, textColor, textAlignment: String?
  
  enum CodingKeys: String, CodingKey {
    case textStyle = "txt_style"
    case textColor = "txt_color"
    case textAlignment = "txt_align"
  }
}
