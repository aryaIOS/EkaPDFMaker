// Created on 02/02/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - DTInsightsContainer
struct DTInsightsResponse: DTComponentProtocol, Codable, Hashable {
  let compCode: String?
  let id: String?
  let heading, subheading: DTTextModel.Text?
  let insightData: InsightData?
  let insightsCta: Cta?
  let track: DTTrack?
  
  enum CodingKeys: String, CodingKey {
    case compCode = "comp_code"
    case heading, subheading, track, id
    case insightsCta = "cta"
    case insightData = "data"
  }
  
  // MARK: - InsightData
  struct InsightData: Codable, Hashable {
    let vital: VitalDetails?
  }
}
