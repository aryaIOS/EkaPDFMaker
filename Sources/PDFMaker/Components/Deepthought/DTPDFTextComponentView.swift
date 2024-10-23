// Created on 16/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftUI

struct DTPDFTextComponentView: View {
  
  let textModel: DTTextModel
  let pageSize = PageSizing.a4.pageSize
  
  var body: some View {
    HStack {
      if let text = textModel.text,
         let value = text.value,
         let style = text.style {
        Text(value)
          .lineLimit(nil)
          .fixedSize(horizontal: false, vertical: true)
          .multilineTextAlignment(.leading)
          .textStyle(dtTextStyle: style)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      Spacer()
    }
  }
}

extension DTTextModel {
  static func formDTTextMockModel() -> DTTextModel {
    DTTextModel(
      compCode: "P-TEXT",
      text: Text(
        style: DTTextStyle(
          textStyle: "title_3",
          textColor: "#111B31",
          textAlignment: "left"
        ),
        value: "Vitals"
      )
    )
  }
}

#Preview {
  DTPDFTextComponentView(textModel: DTTextModel.formDTTextMockModel())
}

//{
//  "comp_code": "P-TEXT",
//  "text": {
//    "style": {
//      "txt_style": "title_3",
//      "txt_color": "#111B31",
//      "txt_align": "left"
//    },
//    "value": "Vitals"
//  }
//},
