// Created on 15/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftUI
import EkaUI

struct DTPDFListComponentView: View {
  
  // MARK: - Properties
  
  let listData: DTListModel
  let pageSize = PageSizing.a4.pageSize
  
  // MARK: - Body
  
  var body: some View {
    VStack {
      if let items = listData.items {
        ForEach(items, id: \.self) { item in
          ListItemRowView(item: item)
            .padding(EkaSpacing.spacingXxs)
          Divider()
        }
      }
    }
    .padding([.leading, .top], EkaSpacing.spacingS)
    .cornerRadius(16)
    .addBorderWithCornerRadius(cornerRadius: 16, borderColor: .borderBrand02)
  }
}

extension DTPDFListComponentView {
  private func ListItemRowView(
    item: DTListModel.Item
  ) -> some View {
    HStack {
      if let text = item.text,
         let value = text.value,
         let style = text.style {
        Text(value)
          .textStyle(dtTextStyle: style)
        Spacer()
      }
    }
  }
}

#Preview {
  ZStack {
    DTPDFListComponentView(listData: DTListModel.formDTListMockDeepthoughtResponse())
  }
}

extension DTListModel {
  static func formDTListMockDeepthoughtResponse() -> DTListModel {
    DTListModel(
      compCode: "P-LIST",
      items: [
        Item(
          text: Text(
            style: DTTextStyle(
              textStyle: "body",
              textColor: "#111B31",
              textAlignment: "left"
            ),
            value: "Eat Khichdi"
          ),
          icon: nil,
          cta: nil
        ),
        Item(
          text: Text(
            style: DTTextStyle(
              textStyle: "body",
              textColor: "#111B31",
              textAlignment: "left"
            ),
            value: "Drink coconut water"
          ),
          icon: nil,
          cta: nil
        ),
        Item(
          text: Text(
            style: DTTextStyle(
              textStyle: "body",
              textColor: "#111B31",
              textAlignment: "left"
            ),
            value: "Plenty of liquids"
          ),
          icon: nil,
          cta: nil
        )
      ],
      style: ComponentStyle(elevated: true)
    )
  }
}

//{
//  "comp_code": "P-LIST",
//  "items": [
//    {
//      "text": {
//        "style": {
//          "txt_style": "body",
//          "txt_color": "#111B31",
//          "txt_align": "left"
//        },
//        "value": "Eat khicdi"
//      }
//    },
//    {
//      "text": {
//        "style": {
//          "txt_style": "body",
//          "txt_color": "#111B31",
//          "txt_align": "left"
//        },
//        "value": "Drink coconut water"
//      }
//    },
//    {
//      "text": {
//        "style": {
//          "txt_style": "body",
//          "txt_color": "#111B31",
//          "txt_align": "left"
//        },
//        "value": "Plenty of liquids"
//      }
//    }
//  ],
//  "style": {
//    "elevated": true
//  }
//  },
