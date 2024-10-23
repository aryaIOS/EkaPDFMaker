// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTButtonModel
struct DTButtonModel: DTComponentProtocol, Codable, Hashable {
  let compCode, leftIcon, rightIcon, value: String?
  let cta: Cta?
  let style: ComponentStyle?
  let hide: Bool?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case leftIcon = "l_icon"
    case rightIcon = "r_icon"
    case value, cta, style, hide
  }
  
  // MARK: - ComponentStyle
  struct ComponentStyle: Codable, Hashable {
    let type: String?
  }
}
