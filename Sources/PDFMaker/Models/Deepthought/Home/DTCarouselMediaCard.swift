// Created on 28/03/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTCarouselMediaCard
struct DTCarouselMediaCard: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let heading, subheading: DTTextModel.Text?
  let mediaCards: [DTMediaCard]?
  let bgImg: String?
  let track: DTTrack?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case heading, subheading, track
    case bgImg = "bg_img"
    case mediaCards = "items"
  }
  
  // MARK: - ImageCard
  struct DTMediaCard: DTComponentProtocol, Codable, Hashable {
    let compCode: String?
    let media: String?
    let cta: Cta?
    let track: DTTrack?
    
    enum CodingKeys: String, CodingKey {
      case compCode = "comp_code"
      case media, cta, track
    }
  }
}
