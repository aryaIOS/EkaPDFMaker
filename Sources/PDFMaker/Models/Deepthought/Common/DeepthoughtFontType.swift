//
//  DeepthoughtFontType.swift
//  EkaPDFGenerator
//
//  Created by Arya Vashisht on 23/10/24.
//

import EkaUI

/// Only these fonts are supported in deepthought system
/// Backend sends these values in the API response
enum DeepThoughtFontType: String {
  case title1 = "title_1"
  case title2 = "title_2"
  case title3 = "title_3"
  case subHeadline = "sub_headline"
  case body = "body"
  case callout = "callout"
  case footnote = "footnote"
  case caption2 = "caption_2"
  case body2Medium = "body_2_medium"
  case heading4Semibold = "heading_4_semibold"
  case body2Regular = "body_2_regular"
  case body1Semibold = "body_1_semibold"
  
  var systemFont: EkaFont {
    switch self {
    case .heading4Semibold, .title3:
      return .heading4SemiBold
      
    case .title1:
      return .heading2SemiBold
      
    case .title2:
      return .heading3SemiBold
      
    case .subHeadline, .body1Semibold:
      return .body1SemiBold
      
    case .body:
      return .body1Regular
      
    case .callout, .body2Regular:
      return .body2Regular
      
    case .footnote:
      return .body3Regular
      
    case .caption2:
      return .label1SemiBold
      
    case .body2Medium:
      return .body2Medium
    }
  }
}
