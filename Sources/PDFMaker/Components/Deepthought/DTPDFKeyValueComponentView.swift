// Created on 15/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftUI
import EkaUI

struct DTPDFKeyValueComponentView: View {
  
  // MARK: - Properties
  
  let dataModel: DTKeyValuePairModel
  let pageSize = PageSizing.a4.pageSize
  let columns: [GridItem] = Array(
    repeating: .init(.flexible(),
                     spacing: 0,
                     alignment: .leading),
    count: 3
  )
  
  // MARK: - Body
  
  var body: some View {
    VStack(spacing: 0) {
      if let dataItems = dataModel.items {
        LazyVGrid(
          columns: columns,
          alignment: .center,
          spacing: 0
        ) {
          ForEach(dataItems, id: \.self) { item in
            CellView(item: item)
          }
        }
      }
    }
  }
}

extension DTPDFKeyValueComponentView {
  private func CellView(item: DTKeyValuePairModel.Item) -> some View {
    HStack {
      VStack(alignment: .leading) {
        /// Key
        if let key = item.key {
          Text(key)
            .textStyle(ekaFont: .label1Regular, color: .text03)
            .fixedSize(horizontal: false, vertical: true)
        }
        /// Value
        if let value = item.value,
           let valueString = item.value?.value,
           let style = value.style {
          Text(valueString)
            .textStyle(dtTextStyle: style)
            .fixedSize(horizontal: false, vertical: true)
        }
        Spacer()
      }
      Spacer()
    }
    .padding(EkaSpacing.spacingS)
    .border(Color(.borderBrand02))
  }
}

#Preview {
  DTPDFKeyValueComponentView(dataModel: DTKeyValuePairModel.formDTKeyValueDeepthoughtMockResponse())
}

extension DTKeyValuePairModel {
  static func formDTKeyValueDeepthoughtMockResponse() -> DTKeyValuePairModel {
    DTKeyValuePairModel(
      compCode: "P-PAIR",
      items: [
       Item(
        value: Value(
          style: DTTextStyle(
            textStyle: "body",
            textColor: "#111B31",
            textAlignment: "left"
          ),
          value: "32.0 /min"
        ),
        key: "Pulse rate",
        icon: nil
       ),
       Item(
        value: Value(
          style: DTTextStyle(
            textStyle: "body",
            textColor: "#111B31",
            textAlignment: "left"
          ),
          value: "43.0 %"
        ),
        key: "Peripheral oxygen saturation",
        icon: nil
       ),
       Item(
        value: Value(
          style: DTTextStyle(
            textStyle: "body",
            textColor: "#111B31",
            textAlignment: "left"
          ),
          value: "32.0 C"
        ),
        key: "Body Temperature",
        icon: nil
       ),
       Item(
        value: Value(
          style: DTTextStyle(
            textStyle: "body",
            textColor: "#111B31",
            textAlignment: "left"
          ),
          value: "32.0 Feet"
        ),
        key: "Body height",
        icon: nil
       )
      ],
      style: ComponentStyle(elevated: true)
    )
  }
}

//"comp_code": "P-PAIR",
//"items": [
//  {
//    "key": "Pulse rate",
//    "value": {
//      "style": {
//        "txt_style": "body",
//        "txt_color": "#111B31",
//        "txt_align": "left"
//      },
//      "value": "32.0 /min"
//    }
//  },
//  {
//    "key": "Peripheral oxygen saturation",
//    "value": {
//      "style": {
//        "txt_style": "body",
//        "txt_color": "#111B31",
//        "txt_align": "left"
//      },
//      "value": "43.0 %"
//    }
//  },
//  {
//    "key": "Body Temperature",
//    "value": {
//      "style": {
//        "txt_style": "body",
//        "txt_color": "#111B31",
//        "txt_align": "left"
//      },
//      "value": "32.0 C"
//    }
//  },
//  {
//    "key": "Body height",
//    "value": {
//      "style": {
//        "txt_style": "body",
//        "txt_color": "#111B31",
//        "txt_align": "left"
//      },
//      "value": "32.0 Feet"
//    }
//  }
//],
//"style": {
//  "elevated": true
//}
//},
