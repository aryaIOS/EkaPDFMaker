// Created on 15/03/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTPageCtas

/// Cta response common for all DeepThought screens
struct DTPageCtas: Codable, Hashable {
  let topLeft, topRight, primary, secondary: DTButtonModel?
  
  enum CodingKeys: String, CodingKey {
    case topLeft = "t_left"
    case topRight = "t_right"
    case primary
    case secondary
  }
}
