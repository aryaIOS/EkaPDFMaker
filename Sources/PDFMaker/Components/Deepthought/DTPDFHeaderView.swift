// Created on 16/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftUI
import EkaUI

public struct DTPDFHeaderView: View {
  
  public let data: DTPDFHeaderViewData
  let pageSize = PageSizing.a4.pageSize
  
  public init(data: DTPDFHeaderViewData) {
    self.data = data
  }
  
  public var body: some View {
    VStack {
      HStack(alignment: .top) {
        Image(.doctorPdfHeader)
          .resizable()
          .scaledToFit()
          .frame(width: 40, height: 40)
        /// Left stack
        VStack {
          if let name = data.name {
            Text(name)
              .textStyle(ekaFont: .body3SemiBold, color: UIColor(resource: .blue400))
          }
        }
        
        Spacer()
        
        /// Right Stack
        VStack {
          if let clinicName = data.clinicName {
            Text(clinicName)
              .textStyle(ekaFont: .body3SemiBold, color: UIColor(resource: .blue400))
          }
          
          if let address = data.address {
            Text(address)
              .textStyle(ekaFont: .body3Medium, color: UIColor(resource: .blue400))
          }
        }
        
      }
      Divider().frame(height: 1).background(Color.black)
    }
    .padding(.horizontal, EkaSpacing.spacingM)
    .padding(.top, EkaSpacing.spacingM)
    .frame(width: pageSize.width)
  }
}

#Preview {
  DTPDFHeaderView(
    data: DTPDFHeaderViewData.formDeepthoughtHeaderViewData(
      doctorName: "Dr. Kunal Katre",
      clinicName: "Kunal's clinic",
      address: "Bangalore"
    )
  )
}
