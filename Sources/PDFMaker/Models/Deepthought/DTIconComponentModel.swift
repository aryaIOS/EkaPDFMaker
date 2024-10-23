// Created on 20/10/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

struct DTIconComponentModel: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let url: String?
  let align: String?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case url, align
  }
}
