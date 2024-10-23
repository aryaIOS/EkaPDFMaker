// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTCarouselCardModel
struct DTCarouselCardModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let items: [Item]?
  let style: ComponentStyle?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case items, style
  }
  
  // MARK: - Item
  struct Item: Codable, Hashable {
    let lines: [Line]?
    let cta: Cta?
    let icon: String?
    let style: ItemStyle?
  }
  
  // MARK: - ItemStyle
  struct ItemStyle: Codable, Hashable {
    let bgColor: String?
    
    enum CodingKeys: String, CodingKey {
      case bgColor = "bg_color"
    }
  }
  
  // MARK: - Line
  struct Line: Codable, Hashable {
    let style: LineStyle?
    let value: String?
  }
  
  // MARK: - LineStyle
  struct LineStyle: Codable, Hashable {
    let textStyle, textColor, textAlignment: String?
    
    enum CodingKeys: String, CodingKey {
      case textStyle = "txt_style"
      case textColor = "txt_color"
      case textAlignment = "txt_align"
    }
  }
  
  // MARK: - ComponentStyle
  struct ComponentStyle: Codable, Hashable {
    let elevated: Bool?
  }
}
