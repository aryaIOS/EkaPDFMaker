// Created on 15/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftUI
import SDWebImageSwiftUI
import EkaUI

@available(iOS 16.0, *)
struct DTPDFCardComponentView: View {
  
  let cardModel: DTCardModel
  let pageSize = PageSizing.a4.pageSize
  
  var body: some View {
    HStack(spacing: 0) {
      /// Image
//      if let cardIcon = cardModel.cardIcon {
//        WebImage(url: URL(string: cardIcon))
//          .resizable()
//          .scaledToFit()
//          .frame(width: 40, height: 40)
//      }
//      Spacer().frame(width: EkaSpacing.spacingM)
      /// Items
      if let items = cardModel.items {
        ForEach(items, id: \.self) { item in
          ItemView(item: item)
          Spacer()
        }
      }
      Spacer()
    }
    .padding(EkaSpacing.spacingS)
    .cornerRadius(16)
    .addBorderWithCornerRadius(cornerRadius: 16, borderColor: .borderBrand02)
  }
}

@available(iOS 16.0, *)
extension DTPDFCardComponentView {
  private func ItemView(item: DTCardModel.Item) -> some View {
    HStack {
      /// Icon
      if let icon = item.icon {
        WebImage(url: URL(string: icon))
      }
      /// Text
      if let text = item.text,
         let style = text.style,
         let value = text.value {
        Text(value)
          .textStyle(dtTextStyle: style)
          .lineLimit(2)
          .multilineTextAlignment(.leading)
      }
    }
  }
}

@available(iOS 16.0, *)
#Preview {
  ZStack {
    DTPDFCardComponentView(cardModel: DTCardModel.formDeepthoughtCardMockResponse())
  }
}

extension DTCardModel {
  static func formDeepthoughtCardMockResponse() -> DTCardModel {
    DTCardModel(
      compCode: "P-CARD",
      cardIcon: "https://deepthought-cdn.eka.care/prescription/medication/icons/syrup.png",
      rightIcon: nil,
      items: [
       Item(
        icon: nil,
        text: Text(
          style:
            DTTextStyle(
              textStyle: "sub_headline",
              textColor: "#111B31",
              textAlignment: "left"
            ),
          value: "Grilinctus  Dx"
        )
       ),
       Item(
        icon: nil,
        text: Text(
          style:
            DTTextStyle(
              textStyle: "callout",
              textColor: "#111B31",
              textAlignment: "left"
            ),
          value: "5 ml • 1-1-1 • Every Day"
        )
       ),
       Item(
        icon: nil,
        text: Text(
          style:
            DTTextStyle(
              textStyle: "footnote",
              textColor: "#111B31",
              textAlignment: "left"
            ),
          value: "After Meal"
        )
       )
      ],
      cta: nil,
      style: ComponentStyle(elevated: true)
    )
  }
}

//{
//  "comp_code": "P-CARD",
//  "card_icon": "https://deepthought-cdn.eka.care/prescription/medication/icons/syrup.png",
//  "items": [
//    {
//      "text": {
//        "style": {
//          "txt_style": "sub_headline",
//          "txt_color": "#111B31",
//          "txt_align": "left"
//        },
//        "value": "Grilinctus  Dx"
//      }
//    },
//    {
//      "text": {
//        "style": {
//          "txt_style": "callout",
//          "txt_color": "#111B31",
//          "txt_align": "left"
//        },
//        "value": "5 ml • 1-1-1 • Every Day"
//      }
//    },
//    {
//      "text": {
//        "style": {
//          "txt_style": "footnote",
//          "txt_color": "#111B31",
//          "txt_align": "left"
//        },
//        "value": "After Meal"
//      }
//    }
//  ],
//  "cta": null,
//  "right_icon": null,
//  "style": {
//    "elevated": true
//  }
//  }
