// Created on 15/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftUI
import EkaUI

extension DeepThoughtFontType {
  /// All fonts are multiplied by a factor of 3/4 = 0.75
  var pdfFont: EkaFont {
    switch self {
    case .heading4Semibold, .title3:
      return .body2SemiBold
      
    case .title1:
      return .heading4SemiBold
      
    case .title2:
      return .body2SemiBold
      
    case .subHeadline, .body1Semibold:
      return .label1SemiBold
      
    case .body:
      return .body3Regular
      
    case .callout, .body2Regular:
      return .label1Regular
      
    case .footnote:
      return .label2Regular
      
    case .caption2:
      return .label2SemiBold
      
    case .body2Medium:
      return .label1Medium
    }
  }
}

extension View {
  func textStyle(dtTextStyle: DTTextStyle) -> some View {
    modifier(
      TextStyle(
        ekaFont: DeepThoughtFontType(
          rawValue: dtTextStyle.textStyle ?? "sub_headline"
        )?.pdfFont ?? .label1Regular,
        uiColor: UIColor(hexString: dtTextStyle.textColor) ?? .black
      )
    )
  }
}
