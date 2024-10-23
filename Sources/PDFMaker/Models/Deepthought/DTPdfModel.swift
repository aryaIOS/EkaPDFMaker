// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTPdfModel
struct DTPdfModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let items: [Item]?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case items
  }
  
  // MARK: - Item
  struct Item: Codable, Hashable {
    let url: String?
  }
}
