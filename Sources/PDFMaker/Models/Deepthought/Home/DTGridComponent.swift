// Created on 28/12/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTGridComponent
struct DTGridComponent: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let id: String?
  let heading, subheading: DTTextModel.Text?
  let gridCards: [DTGridCard]?
  let bgImg: String?
  let cta: Cta?
  let track: DTTrack?

  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case heading, subheading, cta, track, id
    case bgImg = "bg_img"
    case gridCards = "items"
  }
  
  // MARK: - DTGridCard
  struct DTGridCard: Codable, Hashable {
    let title: DTTextModel.Text?
    let icon: String?
    let cta: Cta?
    let track: DTTrack?

    enum CodingKeys: String, CodingKey {
      case cta, title, icon, track
    }
  }
}
