// Created on 16/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

// MARK: - Components

struct DTListComponent: Identifiable {
  let id: UUID // Unique identifier for Identifiable
  private let component: DTAnyComponent
  
  init(_ component: DTAnyComponent) {
    self.id = UUID() // You can use a better identifier based on your model
    self.component = component
  }
  
  // Access the wrapped component
  func getComponent() -> DTAnyComponent {
    return component
  }
}

extension DTListComponent {
  static func formAnyDTComponentsForAvailableData(response: DTPageResponse) -> [DTListComponent] {
    var components: [DTAnyComponent]?
    switch response.data?.pageType {
    case .defaultPage:
      components = response.data?.pageComponents
    case .tab:
      components = formComponentsForTab(response: response)
    default: break
    }
    var listComponents: [DTListComponent] = []
    guard let components else { return listComponents }
    components.forEach { component in
      if let compCode = component.compCode,
         /// Add the component only if its available type
         let _ = DTPDFAvailableComponentType(rawValue: compCode) {
        listComponents.append(DTListComponent(component))
      }
    }
    return listComponents
  }
  
  private static func formComponentsForTab(response: DTPageResponse) -> [DTAnyComponent] {
    guard let firstTabComponentData = response.data?.tab?.details?.tabs?.first?.pageComponents else { return [] }
    return firstTabComponentData
  }
}

// MARK: - Header Data

public struct DTPDFHeaderViewData {
  let name, clinicName, address: String?
}

extension DTPDFHeaderViewData {
  public static func formDeepthoughtHeaderViewData(
    doctorName: String?,
    clinicName: String?,
    address: String?
  ) -> DTPDFHeaderViewData {
    DTPDFHeaderViewData(
      name: doctorName ?? "",
      clinicName: clinicName ?? "",
      address: address ?? ""
    )
  }
}
