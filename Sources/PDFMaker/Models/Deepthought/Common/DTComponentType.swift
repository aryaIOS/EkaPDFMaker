//
//  DTComponentType.swift
//  EkaPDFGenerator
//
//  Created by Arya Vashisht on 23/10/24.
//

import Foundation

enum DTComponentType: String, CaseIterable {
  case text = "P-TEXT"
  case banner = "P-BANR"
  case card = "P-CARD"
  case list = "P-LIST"
  case keyValuePair = "P-PAIR"
  case cardCarousel = "P-CWGC"
  case pageInvoice = "P-INVC"
  case pageMarquee = "P-MARQ"
  case gradientBanner = "P-GBAN"
  case orderStatus = "P-ORST"
  case button = "P-BUTN"
  case featuredCard = "P-FCRD"
  case fileCarousel = "P-FILE"
  case icon = "P-ICON"
  case pagePDF = "P-PDFS"
  /// Handles those cases where BE sents images instead of pdf
  case pageImages = "P-IMAG"
  case lineBreak = "P-LBRK"
  case adMob = "P-ADMB"
  
  /// Homepage components
  case gridComponent = "C-GRID"
  case carouselFImageCard = "CR-FIMAGE"
  case carouselPImageCard = "CR-PIMAGE"
  case carouselStandardCard = "CR-STANDARD"
  case carouselPriceCard = "CR-PRICE"
  case streaksV2 = "C-STREAK"
  case insights = "C-INSIGHT"
  case carouselMediaCard = "CR-MEDIA"
}
