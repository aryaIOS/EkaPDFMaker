// Created on 16/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import SwiftUI
import EkaUI

@available(iOS 16.0, *)
public struct DTPDFRendererView: View {
  
  let response: DTPageResponse
  let components: [DTListComponent]
  let pageSize = PageSizing.a4.pageSize
//  /// Total height of the view so far for a page
//  @State var totalViewHeightForPage: CGFloat = 0
//  @State var componentsHeight: [CGFloat] = []
//  @State var componentTopPaddingHeight: [CGFloat] = []
//  @State var didCalculateAllComponentsHeight: Bool = false
  /// Additional offset for allowing component to push a little bit more in the next page
//  let componentNextPagePaddingPushAdditionalOffset: CGFloat = 10
  
  public init(
    data: Data
  ) {
    self.response = DTPageResponse.formDTPageResponse(data: data)
    self.components = DTListComponent.formAnyDTComponentsForAvailableData(components: response.data?.pageComponents)
//    _componentsHeight = State(initialValue: Array(repeating: CGFloat(0), count: components.count))
//    _componentTopPaddingHeight = State(initialValue: Array(repeating: CGFloat(0), count: components.count))
  }
  
  public var body: some View {
    VStack(spacing: 0) {
      ForEach(Array(components.enumerated()), id: \.element.id) { index, component in
        DTComponentView(index: index, component: component)
      }
    }
    .padding(.top, EkaSpacing.spacingS)
    .padding(.bottom, EkaSpacing.spacingXs)
    .padding(.horizontal, EkaSpacing.spacingL)
    .frame(maxWidth: pageSize.width)
  }
}

@available(iOS 16.0, *)
extension DTPDFRendererView {
  /// Process each component so that it is not cut while moving items to next page
//  private func processComponentSize(
//    componentIndex: Int,
//    size: CGSize
//  ) {
//    guard size != CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude) else { return }
//    print("Component index is \(componentIndex)")
//    print("Component Size is \(size)")
//    /// Update the components height map
//    componentsHeight[componentIndex] = size.height
//    /// Array of components with non zero height
//    let nonZeroHeightComponents = componentsHeight.filter({ !$0.isZero })
//    /// Don't process anything until we have all the components height
//    guard nonZeroHeightComponents.count == components.count,
//          !didCalculateAllComponentsHeight else { return }
    
//    /// Traverse the array starting from first index
//    for (index, height) in componentsHeight.enumerated() {
//      /// Add to total view height for the page
//      totalViewHeightForPage = CGFloat(
//       (totalViewHeightForPage + height)
//      )
//      print("Total View height for page is -> \(totalViewHeightForPage)")
//      /// Update component Top padding
//      let componentTopPadding = calculateTopPaddingForComponent(viewHeightForPage: totalViewHeightForPage, at: index)
//      /// If we have top padding for any view
//      if componentTopPadding > 0 {
//        totalViewHeightForPage = 0 /// Reset page height
//        totalViewHeightForPage += componentNextPagePaddingPushAdditionalOffset /// Add additional padding for cushion on top of page
//        componentTopPaddingHeight[index] = componentTopPadding
//      }
//    }
//    didCalculateAllComponentsHeight = true
//    print("Components height are -> \(componentsHeight)")
//    print("Component Top Padding Height count is -> \(componentTopPaddingHeight.count)")
//    print("Component Top Padding Height is -> \(componentTopPaddingHeight)")
//  }
}

@available(iOS 16.0, *)
extension DTPDFRendererView {
  /// Padding to be given on top of the view so that
//  private func calculateTopPaddingForComponent(
//    viewHeightForPage: CGFloat,
//    at index: Int
//  ) -> CGFloat {
//    guard index > 0 else { return 0 } // No padding for the first element
//    
//    /// If total height till now is more than the current page height add padding on top of that component and move it to the next page
//    if viewHeightForPage > availableHeight {
//      /// Difference in the total height and page height
//      let difference: CGFloat = viewHeightForPage - availableHeight
//      /// Total padding by which the component is to be moved
//      let totalPadding = difference + componentNextPagePaddingPushAdditionalOffset
//      /// Reset the total view height as we are on the new page now
//      print("Total View height is -> \(viewHeightForPage) and total padding is -> \(totalPadding) ")
//      return totalPadding
//    } else {
//      return 0
//    }
//  }
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
