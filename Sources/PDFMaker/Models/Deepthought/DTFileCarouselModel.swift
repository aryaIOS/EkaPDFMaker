// Created on 18/10/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTFileCarouselModel
struct DTFileCarouselModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let items: [Item]?
  let style: ComponentStyle?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case items, style
  }
  
  // MARK: - Item
  struct Item: Codable, Hashable {
    let thumbnail: String?
    let cta: Cta?
    
    enum CodingKeys: String, CodingKey {
      case thumbnail, cta
    }
  }
  
  // MARK: - ComponentStyle
  struct ComponentStyle: Codable, Hashable {
    let elevated: Bool?
  }
}
