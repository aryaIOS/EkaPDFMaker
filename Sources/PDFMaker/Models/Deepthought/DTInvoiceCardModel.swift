// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTInvoiceCardModel
struct DTInvoiceCardModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let sections: [[Section]]?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case sections
  }
  
  // MARK: - Section
  struct Section: Codable, Hashable {
    let title, subtitle, value: Text?
    
    enum CodingKeys: String, CodingKey {
      case title
      case subtitle = "sub_title"
      case value
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
