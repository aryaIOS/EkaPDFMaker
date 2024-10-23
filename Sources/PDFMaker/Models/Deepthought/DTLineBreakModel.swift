// Created on 16/04/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

struct DTLineBreakModel: DTComponentProtocol, Codable, Hashable {
  var id = UUID()
  let compCode: String?
  let size: Int?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case size
  }
}
