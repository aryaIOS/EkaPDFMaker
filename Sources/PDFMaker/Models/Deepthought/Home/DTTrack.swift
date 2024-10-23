// Created on 16/01/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

struct DTTrack: Codable, Hashable {
  let recoId, recoKey, hashId, position: String?
  
  enum CodingKeys: String, CodingKey {
    case recoId = "reco_id"
    case recoKey = "reco_key"
    case position
    case hashId = "hash"
  }
}

enum HomeEventType {
  case homeFeatureCardClicks
  case homeActionCardClicks
  case homeRecommendationCardClicks
}

struct TrackEvent {
  let homeEventType: HomeEventType
  let pid: String?
  let title: String?
  let position: String?
  let recoId: String?
  let recoKey: String?
  
  init(
    homeEventType: HomeEventType,
    pid: String? = nil,
    title: String? = nil,
    position: String? = nil,
    recoId: String? = nil,
    recoKey: String? = nil
  ) {
    self.homeEventType = homeEventType
    self.pid = pid
    self.title = title
    self.position = position
    self.recoId = recoId
    self.recoKey = recoKey
  }
}
