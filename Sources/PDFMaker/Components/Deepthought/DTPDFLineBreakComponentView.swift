// Created on 16/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftUI

struct DTPDFLineBreakComponentView: View {
  let lineBreakModel: DTLineBreakModel
  let pageSize = PageSizing.a4.pageSize
  
  var body: some View {
    HStack {
      VStack(spacing: 0) {
        if let size = lineBreakModel.size {
          Spacer().frame(height: CGFloat(Double(size) * 0.75))
        }
      }
      Spacer()
    }
  }
}

extension DTLineBreakModel {
  static func formDeepthoughtMockLineBreakModel() -> DTLineBreakModel {
    DTLineBreakModel(
      compCode: "P-LBRK",
      size: 12
    )
  }
}

#Preview {
  DTPDFLineBreakComponentView(lineBreakModel: DTLineBreakModel.formDeepthoughtMockLineBreakModel())
}

//{
//  "comp_code": "P-LBRK",
//  "size": 12
//},
