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
//  static func formAnyDTComponent(components: [DTAnyComponent]?) -> [DTListComponent] {
//    var listComponents: [DTListComponent] = []
//    guard let components else { return listComponents }
//    components.forEach { anyComponent in
//      listComponents.append(DTListComponent(anyComponent))
//    }
//    return listComponents
//  }
  
  static func formAnyDTComponentsForAvailableData(components: [DTAnyComponent]?) -> [DTListComponent] {
    var listComponents: [DTListComponent] = []
    guard let components else { return listComponents }
    components.forEach { component in
      if let compCode = component.compCode,
         /// Add the component only if its available type
         let availableComponentType = DTPDFAvailableComponentType(rawValue: compCode) {
        listComponents.append(DTListComponent(component))
      }
    }
    return listComponents
  }
}

// MARK: - Header Data

struct DTPDFHeaderViewData {
  let name, clinicName, address: String?
}

extension DTPDFHeaderViewData {
  static func formDeepthoughtHeaderViewData() -> DTPDFHeaderViewData {
    DTPDFHeaderViewData(
      name: "Dr. Kunal Katre",
      clinicName: "Kunal Clinic",
      address: "Bangalore"
    )
  }
}
