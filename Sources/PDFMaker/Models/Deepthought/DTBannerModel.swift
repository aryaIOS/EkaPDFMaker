// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTBannerModel
struct DTBannerModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let items: [Item]?
  let style: ComponentStyle?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case items, style
  }
  
  // MARK: - Item
  struct Item: Codable, Hashable {
    let style: ItemStyle?
    let title, body: String?
    let cta: Cta?
    let icon: String?
  }
  
  // MARK: - ItemStyle
  struct ItemStyle: Codable, Hashable {
    let bgColor: String?
    
    enum CodingKeys: String, CodingKey {
      case bgColor = "bg_color"
    }
  }
  
  // MARK: - ComponentStyle
  struct ComponentStyle: Codable, Hashable {
    let elevated: Bool?
  }
}
