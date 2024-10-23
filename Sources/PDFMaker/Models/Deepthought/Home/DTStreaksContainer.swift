// Created on 05/01/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTStreaksComponentResponse
struct DTStreaksComponentResponse: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let id: String?
  let heading, subheading: DTTextModel.Text?
  let streakContainer: StreaksContainer?
  let streaksCta: Cta?
  let track: DTTrack?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case heading, subheading, track, id
    case streaksCta = "cta"
    case streakContainer = "data"
  }
  
  // MARK: - StreaksContainer
  struct StreaksContainer: Codable, Hashable {
    let data: VitalsData?
    
    // MARK: - VitalsData
    struct VitalsData: Codable, Hashable {
      let vitalIds: [VitalDetails]?
      let bottomCtaDetails: BottomCtaDetails?
      
      enum CodingKeys: String, CodingKey {
        case vitalIds = "vitals"
        case bottomCtaDetails = "bottom"
      }
    }
  }
}
