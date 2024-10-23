// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTFeaturedCardModel
struct DTFeaturedCardModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let items: [Item]?
  let style: ComponentStyle?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case items, style
  }
  
  // MARK: - Item
  struct Item: Codable, Hashable {
    let cardText, image: String?
    let cta: Cta?
    let style: ComponentStyle?
    
    enum CodingKeys: String, CodingKey {
      case cardText = "card_text"
      case image, cta, style
    }
  }
  
  // MARK: - ComponentStyle
  struct ComponentStyle: Codable, Hashable {
    let elevated: Bool?
    let hasBg: Bool?
    
    enum CodingKeys: String, CodingKey {
      case hasBg = "has_bg"
      case elevated
    }
  }
}
