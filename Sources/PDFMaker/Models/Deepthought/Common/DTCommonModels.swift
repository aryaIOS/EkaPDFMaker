//
//  DTCommonModels.swift
//  EkaPDFGenerator
//
//  Created by Arya Vashisht on 23/10/24.
//

import Foundation

// MARK: - Vital details
struct VitalDetails: Codable, Hashable {
  var id: String?
  var name: String?
}

// MARK: - Bottom Cta details
struct BottomCtaDetails: Codable, Hashable {
  var title: String?
  var cta: Cta?
}
