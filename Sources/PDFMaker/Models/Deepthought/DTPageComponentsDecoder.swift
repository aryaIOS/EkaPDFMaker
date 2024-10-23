// Created on 27/12/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftyJSON
import Foundation

final class DTPageComponentsDecoder {
  
  static func decodeComponents(fromJsonArray jsonArray: [JSON]) -> [DTAnyComponent]? {
    var components = [DTAnyComponent]()
    for json in jsonArray {
      if let compCode = json["comp_code"].string,
         let compType = DTComponentType(rawValue: compCode),
         let dictionary = json.dictionaryObject,
         let data = try? JSONSerialization.data(withJSONObject: dictionary) {
        let component: DTAnyComponent? = {
          switch compType {
            case .text:
              return try? JSONDecoder().decode(DTTextModel.self, from: data)
            case .banner:
              return try? JSONDecoder().decode(DTBannerModel.self, from: data)
            case .card:
              return try? JSONDecoder().decode(DTCardModel.self, from: data)
            case .list:
              return try? JSONDecoder().decode(DTListModel.self, from: data)
            case .keyValuePair:
              return try? JSONDecoder().decode(DTKeyValuePairModel.self, from: data)
            case .cardCarousel:
              return try? JSONDecoder().decode(DTCarouselCardModel.self, from: data)
            case .pagePDF, .pageImages:
              return try? JSONDecoder().decode(DTPdfModel.self, from: data)
            case .pageInvoice:
              return try? JSONDecoder().decode(DTInvoiceCardModel.self, from: data)
            case .pageMarquee:
              return try? JSONDecoder().decode(DTMarqueeLabelModel.self, from: data)
            case .gradientBanner:
              return try? JSONDecoder().decode(DTGradientBannerModel.self, from: data)
            case .orderStatus:
              return try? JSONDecoder().decode(DTOrderStatusModel.self, from: data)
            case .button:
              return try? JSONDecoder().decode(DTButtonModel.self, from: data)
            case .featuredCard:
              return try? JSONDecoder().decode(DTFeaturedCardModel.self, from: data)
            case .fileCarousel:
              return try? JSONDecoder().decode(DTFileCarouselModel.self, from: data)
            case .icon:
              return try? JSONDecoder().decode(DTIconComponentModel.self, from: data)
            case .lineBreak:
              return try? JSONDecoder().decode(DTLineBreakModel.self, from: data)
            
            /// Home Components
            case .gridComponent:
              return try? JSONDecoder().decode(DTGridComponent.self, from: data)
            case .carouselFImageCard, .carouselPImageCard:
              return try? JSONDecoder().decode(DTCarouselImageCard.self, from: data)
            case .carouselStandardCard:
              return try? JSONDecoder().decode(DTCarouselStandardCard.self, from: data)
            case .carouselPriceCard:
              return try? JSONDecoder().decode(DTCarouselPriceCard.self, from: data)
            case .streaksV2:
              return try? JSONDecoder().decode(DTStreaksComponentResponse.self, from: data)
            case .insights:
              return try? JSONDecoder().decode(DTInsightsResponse.self, from: data)
            case .carouselMediaCard:
              return try? JSONDecoder().decode(DTCarouselMediaCard.self, from: data)
            
            default:
              return nil
          }
        }()
        if let component {
          components.append(component)
        }
      }
    }
    return components.isEmpty ? nil : components
  }
}
