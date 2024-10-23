// Created on 27/12/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTCarouselImageCard
struct DTCarouselImageCard: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let id: String?
  let heading, subheading: DTTextModel.Text?
  let imageCards: [DTImageCard]?
  let bgImg: String?
  let track: DTTrack?
  /// Have added this key as am using the Full or Portrait image component on UIKit DT page, so in the cell registration it helps.
  let isFixedSize: Bool?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case heading, subheading, track, id
    case bgImg = "bg_img"
    case imageCards = "items"
    case isFixedSize = "is_fixed_size"
  }
  
  // MARK: - ImageCard
  struct DTImageCard: DTComponentProtocol, Codable, Hashable {
    let compCode: String?
    let img, lottieImage: String?
    let cta: Cta?
    let track: DTTrack?
    
    enum CodingKeys: String, CodingKey {
      case compCode = "comp_code"
      case img, cta, lottieImage = "lottie_image"
      case track
    }
  }
}
