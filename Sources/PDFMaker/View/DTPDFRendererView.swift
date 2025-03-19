// Created on 16/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftUI
import EkaUI

@available(iOS 16.0, *)
public struct DTPDFRendererView: View {
  
  let response: DTPageResponse
  let components: [DTListComponent]
  let pageSize = PageSizing.a4.pageSize

  public init(
    data: Data
  ) {
    self.response = DTPageResponse.formDTPageResponse(data: data)
    self.components = DTListComponent.formAnyDTComponentsForAvailableData(response: response)
  }
  
  public var body: some View {
    VStack(spacing: 0) {
      ForEach(Array(components.enumerated()), id: \.element.id) { index, component in
        DTComponentView(index: index, component: component)
      }
    }
    .padding(.vertical, EkaSpacing.spacingXxxs)
    .padding(.horizontal, EkaSpacing.spacingL)
    .frame(maxWidth: pageSize.width)
    .edgesIgnoringSafeArea(.all)
  }
}

extension DTPageResponse {
  public static func formDTPageResponse(data: Data) -> DTPageResponse {
    do {
      let decoder = JSONDecoder()
      let dtPageResponse = try decoder.decode(DTPageResponse.self, from: data)
      return dtPageResponse
    } catch {
      print("Error loading or decoding JSON :\(error)")
    }
    return DTPageResponse(success: nil, data: nil, errorEvent: nil)
  }
  
  static func formMockDTData() -> Data {
    let fileName = "DptData"
    if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
      do {
        /// Load the contents of the json
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
        return data
      } catch {
        print("Error loading or decoding JSON :\(error)")
      }
    }
    print("Loading nil dt page response")
    return Data()
  }
}

@available(iOS 16.0, *)
#Preview {
  ScrollView {
    DTPDFRendererView(data: DTPageResponse.formMockDTData())
  }
}
