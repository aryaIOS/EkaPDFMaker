// Created on 22/06/23. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import Foundation

protocol DTComponentProtocol: Hashable, Codable {
  var compCode: String? { get }
}

typealias DTAnyComponent = any DTComponentProtocol
