// Created on 04/05/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTPageDetails
/// Contains header and CTA details of a deepthought page
struct DTPageDetails: Codable {
  let pageTitle: PageTitle?
  let pageCtas: DTPageCtas?
  
  enum CodingKeys: String, CodingKey {
    case pageTitle = "page_title"
    case pageCtas = "page_ctas"
  }
  
  // MARK: - PageTitle
  struct PageTitle: Codable {
    let title, subTitle: String?
    
    enum CodingKeys: String, CodingKey {
      case title
      case subTitle = "sub_title"
    }
  }
}
