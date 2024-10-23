// Created on 27/12/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTCarouselStandardCard
struct DTCarouselStandardCard: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let id: String?
  let heading, subheading: DTTextModel.Text?
  let standardCards: [DTStandardCard]?
  let bgImg: String?
  let track: DTTrack?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case heading, subheading, track, id
    case bgImg = "bg_img"
    case standardCards = "items"
  }
  
  // MARK: - StandardCard
  struct DTStandardCard: DTComponentProtocol, Codable, Hashable {
    let compCode: String?
    let title, subtitle: DTTextModel.Text?
    let bgImg, fgImg: String?
    let cta: Cta?
    let track: DTTrack?
    let reason: String?
    
    enum CodingKeys: String, CodingKey {
      case compCode = "comp_code"
      case bgImg = "bg_img", fgImg = "fg_img"
      case cta, title, subtitle, track, reason
    }
  }
}
