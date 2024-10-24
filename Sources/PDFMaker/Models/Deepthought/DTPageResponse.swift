// Created on 15/03/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftyJSON

enum DeepThoughtPageType: String {
  case defaultPage = "default"
  case calendar
  case tab
}

// MARK: - DTPageResponse
public struct DTPageResponse: Decodable {
  let success: Bool?
  let data: PageData?
  let errorEvent: String?
  
  enum CodingKeys: String, CodingKey {
    case success
    case data
    case errorEvent = "error_event"
  }
  
  // MARK: - PageData
  struct PageData: Decodable {
    let rawPageType: String?
    let pageDetails: DTPageDetails?
    let calendar: CalendarData?
    let tab: TabData?
    let pageComponents: [DTAnyComponent]?
    let track: Track?
    let shouldShowGoogleAd: Bool?
    let generatePdf: Bool?
    
    enum CodingKeys: String, CodingKey {
      case rawPageType = "page_type"
      case pageDetails = "page_details"
      case calendar = "calendar_details"
      case tab = "tab_details"
      case pageComponents = "page_components"
      case track
      case shouldShowGoogleAd = "should_show_google_ad"
      case generatePdf = "generate_pdf"
    }
    
    var pageType: DeepThoughtPageType? {
      guard let rawPageType else { return nil } 
      return DeepThoughtPageType(rawValue: rawPageType)
    }
    
    init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<DTPageResponse.PageData.CodingKeys> = try decoder.container(keyedBy: DTPageResponse.PageData.CodingKeys.self)
      self.rawPageType = try container.decodeIfPresent(String.self, forKey: DTPageResponse.PageData.CodingKeys.rawPageType)
      self.pageDetails = try container.decodeIfPresent(DTPageDetails.self, forKey: DTPageResponse.PageData.CodingKeys.pageDetails)
      self.calendar = try container.decodeIfPresent(CalendarData.self, forKey: DTPageResponse.PageData.CodingKeys.calendar)
      self.track = try container.decodeIfPresent(Track.self, forKey: DTPageResponse.PageData.CodingKeys.track)
      self.tab = try container.decodeIfPresent(TabData.self, forKey: DTPageResponse.PageData.CodingKeys.tab)
      self.shouldShowGoogleAd = try container.decodeIfPresent(Bool.self, forKey: DTPageResponse.PageData.CodingKeys.shouldShowGoogleAd)
      if let jsonArray = try container.decodeIfPresent([JSON].self, forKey: DTPageResponse.PageData.CodingKeys.pageComponents) {
        self.pageComponents = DTPageComponentsDecoder.decodeComponents(fromJsonArray: jsonArray)
      } else {
        self.pageComponents = nil
      }
      self.generatePdf = try container.decodeIfPresent(Bool.self, forKey: DTPageResponse.PageData.CodingKeys.generatePdf)
    }
  }
  
  // MARK: - CalendarData
  struct CalendarData: Decodable {
    let compID: String?
    let details: CalendarDetails?
    
    enum CodingKeys: String, CodingKey {
      case compID = "comp_id"
      case details
    }
  }
  
  // MARK: - CalendarDetails
  struct CalendarDetails: Decodable {
    let weekdays: [Weekday]?
    let next: Bool?
    let prev: Bool?
    let landingEpoch: Int64?
    
    enum CodingKeys: String, CodingKey {
      case weekdays, next, prev
      case landingEpoch = "landing_epoch"
    }
  }
  
  // MARK: - Weekday
  struct Weekday: Decodable, Hashable {
    let dateDetails: DateDetails?
    let style: WeekdayStyle?
    let pageComponents: [DTAnyComponent]?
    let pageCtas: DTPageCtas?
    
    enum CodingKeys: String, CodingKey {
      case dateDetails = "date_details"
      case style
      case pageComponents = "page_components"
      case pageCtas = "page_ctas"
    }
    
    init(
      dateDetails: DateDetails?,
      style: WeekdayStyle?,
      pageComponents: [DTAnyComponent]?,
      pageCtas: DTPageCtas?
    ) {
      self.dateDetails = dateDetails
      self.style = style
      self.pageComponents = pageComponents
      self.pageCtas = pageCtas
    }
    
    init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<DTPageResponse.Weekday.CodingKeys> = try decoder.container(keyedBy: DTPageResponse.Weekday.CodingKeys.self)
      self.dateDetails = try container.decodeIfPresent(DateDetails.self, forKey: DTPageResponse.Weekday.CodingKeys.dateDetails)
      self.style = try container.decodeIfPresent(WeekdayStyle.self, forKey: DTPageResponse.Weekday.CodingKeys.style)
      self.pageCtas = try container.decodeIfPresent(DTPageCtas.self, forKey: DTPageResponse.Weekday.CodingKeys.pageCtas)
      if let jsonArray = try container.decodeIfPresent([JSON].self, forKey: DTPageResponse.Weekday.CodingKeys.pageComponents) {
        self.pageComponents = DTPageComponentsDecoder.decodeComponents(fromJsonArray: jsonArray)
      } else {
        self.pageComponents = nil
      }
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(dateDetails)
      hasher.combine(style)
      hasher.combine(pageCtas)
    }

    static func == (lhs: DTPageResponse.Weekday, rhs: DTPageResponse.Weekday) -> Bool {
      return lhs.dateDetails == rhs.dateDetails
      && lhs.style == rhs.style
      && lhs.pageCtas == rhs.pageCtas
    }
  }
  
  // MARK: - DateDetails
  struct DateDetails: Codable, Hashable {
    let wk: String?
    let id: Int64?
    let humanize: String?
    let disabled: Bool?
    
    enum CodingKeys: String, CodingKey {
      case wk, id, humanize, disabled
//      case landingEpoch = "landing_epoch"
    }
  }
  
  // MARK: - WeekdayStyle
  struct WeekdayStyle: Codable, Hashable {
    let state, color: String?
    
    enum CodingKeys: String, CodingKey {
      case state = "clwk_state"
      case color = "clwk_color"
    }
  }
  
  // MARK: - TabData
  struct TabData: Decodable {
    let compID: String?
    let details: TabDetails?
    
    enum CodingKeys: String, CodingKey {
      case compID = "comp_id"
      case details
    }
  }
  
  // MARK: - TabDetails
  struct TabDetails: Decodable {
    let tabs: [Tab]?
  }
  
  // MARK: - Tab
  struct Tab: Decodable {
    let name: String?
    let pageComponents: [DTAnyComponent]?
    let selected: Bool?
    let pageCtas: DTPageCtas?
    
    enum CodingKeys: String, CodingKey {
      case name
      case pageComponents = "page_components"
      case selected
      case pageCtas = "page_ctas"
    }
    
    init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<DTPageResponse.Tab.CodingKeys> = try decoder.container(keyedBy: DTPageResponse.Tab.CodingKeys.self)
      self.name = try container.decodeIfPresent(String.self, forKey: DTPageResponse.Tab.CodingKeys.name)
      self.selected = try container.decodeIfPresent(Bool.self, forKey: DTPageResponse.Tab.CodingKeys.selected)
      self.pageCtas = try container.decodeIfPresent(DTPageCtas.self, forKey: DTPageResponse.Tab.CodingKeys.pageCtas)
      if let jsonArray = try container.decodeIfPresent([JSON].self, forKey: DTPageResponse.Tab.CodingKeys.pageComponents) {
        self.pageComponents = DTPageComponentsDecoder.decodeComponents(fromJsonArray: jsonArray)
      } else {
        self.pageComponents = nil
      }
    }
  }
  
  // MARK: - Track
  struct Track: Decodable, Encodable {
    let refreshToken: Bool?
    let eventId: String?
    
    enum CodingKeys: String, CodingKey {
      case refreshToken = "refresh_token"
      case eventId = "event_id"
    }
  }
}
