// Created on 16/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation
import SwiftUI

/// Only the components that are available we will deal with these only
enum DTPDFAvailableComponentType: String, CaseIterable {
  case list = "P-LIST"
  case text = "P-TEXT"
  case card = "P-CARD"
  case keyValuePair = "P-PAIR"
  case lineBreak = "P-LBRK"
}

// MARK: - Components

@available(iOS 16.0, *)
extension DTPDFRendererView {
  func DTComponentView(index: Int, component: DTListComponent) -> some View {
    let dtComponent = component.getComponent()
    
    // Use a conditional return, and wrap each return type in AnyView
    if let compCode = dtComponent.compCode,
       let compCodeType = DTPDFAvailableComponentType(rawValue: compCode) {
      switch compCodeType {
      case .lineBreak:
        if let lineBreakComponent = component.getComponent() as? DTLineBreakModel {
          return AnyView(DTPDFLineBreakComponentView(lineBreakModel: lineBreakComponent))
        }
      case .text:
        if let textComponent = component.getComponent() as? DTTextModel {
          return AnyView(DTPDFTextComponentView(textModel: textComponent))
        }
      case .card:
        if let cardComponent = component.getComponent() as? DTCardModel {
          return AnyView(DTPDFCardComponentView(cardModel: cardComponent))
        }
      case .keyValuePair:
        if let keyValueComponent = component.getComponent() as? DTKeyValuePairModel {
          return AnyView(DTPDFKeyValueComponentView(dataModel: keyValueComponent))
        }
      case .list:
        if let listComponent = component.getComponent() as? DTListModel {
          return AnyView(DTPDFListComponentView(listData: listComponent))
        }
      }
    }
    
    // Return a default empty view wrapped in AnyView when no component matches
    return AnyView(EmptyView().frame(width: 0, height: 0))
  }

}
