// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTKeyValuePairModel
struct DTKeyValuePairModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let items: [Item]?
  let style: ComponentStyle?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case items, style
  }
  
  // MARK: - Item
  struct Item: Codable, Hashable {
    let value: Value?
    let key, icon: String?
  }
  
  // MARK: - Value
  struct Value: Codable, Hashable {
    let style: DTTextStyle?
    let value: String?
  }
  
  // MARK: - ComponentStyle
  struct ComponentStyle: Codable, Hashable {
    let elevated: Bool?
  }
}
