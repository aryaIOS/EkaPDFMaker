// Created on 27/12/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTCarouselPriceCard
struct DTCarouselPriceCard: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let id: String?
  let heading, subheading: DTTextModel.Text?
  let priceCards: [DTPriceCard]?
  let bgImg: String?
  let track: DTTrack?

  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case heading, subheading, track, id
    case bgImg = "bg_img"
    case priceCards = "items"
  }
  
  // MARK: - PriceCard
  struct DTPriceCard: DTComponentProtocol, Codable, Hashable {
    let compCode: String?
    let title, subtitle: DTTextModel.Text?
    let bgImg, fgImg: String?
    let cta: Cta?
    let valDetails: ValDetails?
    let track: DTTrack?
    let reason: String?

    enum CodingKeys: String, CodingKey {
      case compCode = "comp_code"
      case bgImg = "bg_img", fgImg = "fg_img", valDetails = "val_details"
      case cta, title, subtitle, track, reason
    }
  }
  
  struct ValDetails: Codable, Hashable {
    let actual, strikeOff: String?
    
    enum CodingKeys: String, CodingKey {
      case actual, strikeOff = "strike_off"
    }
  }
}
