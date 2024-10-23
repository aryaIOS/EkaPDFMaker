//
//  Cta.swift
//  EkaPDFGenerator
//
//  Created by Arya Vashisht on 23/10/24.
//

import Foundation
import SwiftyJSON

public typealias Params = JSON

/// Source of truth for all the `CTA`s used in the app except `CTA` of `HomeCard`
struct Cta: Codable, Hashable, Identifiable {
  public let id = UUID()
  public let title: String?
  public let subtitle: String?
  public let action: String?
  public let pageID: String?
  public let params: Params?
  public let syncID: String?
  public let invokeApi: InvokeAPI?
  
  enum CodingKeys: String, CodingKey {
    case title, params, action, subtitle
    case pageID = "pid"
    case syncID = "syncid"
    case invokeApi = "invoke_api"
  }
  
  init(
    title: String? = nil,
    subtitle: String? = nil,
    action: String? = nil,
    pageID: String? = nil,
    params: Params? = nil,
    syncID: String? = nil,
    invokeAPi: InvokeAPI? = nil
  ) {
    self.title = title
    self.subtitle = subtitle
    self.action = action
    self.pageID = pageID
    self.params = params
    self.syncID = syncID
    self.invokeApi = invokeAPi
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(title)
    hasher.combine(action)
    hasher.combine(pageID)
    hasher.combine(syncID)
  }
  
  static func == (lhs: Cta, rhs: Cta) -> Bool {
    return lhs.title == rhs.title &&
    lhs.subtitle == rhs.subtitle &&
    lhs.action == rhs.action &&
    lhs.pageID == rhs.pageID &&
    lhs.syncID == rhs.syncID
  }
  
  static func parseParams(fromPayload payload: [AnyHashable: Any], withEkaRouteOrigin routeOrigin: EkaRouteOrigin) -> Params? {
    switch routeOrigin {
      
    case .apiCta:
      break
      
    case .branchLink:
      /// This is to handle branch links created from the dashboard in which json is stringified
      if let data = payload["params"] as? String,
         let decodedData = data.data(using: .utf8) {
        return try? Params(data: decodedData)
      }
      /// Service generated branch links params key is handled as json
      let json = Params(payload)
      return json["params"]
      
    case .fcm:
      if let data = payload["data"] as? String,
         let decodedData = data.data(using: .utf8),
         let json = try? Params(data: decodedData) {
        return json["params"]
      }
      /// This is to handle fcm messages created from the dashboard in which json is stringified
      if let paramsString = payload["params"] as? String,
         let decodedData = paramsString.data(using: .utf8) {
        return try? Params(data: decodedData)
      }
      
    case .webEngage:
      let json = JSON(payload)
      let customDataArray = json["customData"].arrayValue
      
      for jsonElement in customDataArray where jsonElement["key"].stringValue == "params" {
        let value = jsonElement["value"].stringValue
        if let decodedParamsData = value.data(using: .utf8) {
          return try? Params(data: decodedParamsData)
        }
      }
    }
    return nil
  }
  
  struct InvokeAPI: Codable {
    public let url: String?
    public let method: String?
    public let body: JSON?
  }
}

