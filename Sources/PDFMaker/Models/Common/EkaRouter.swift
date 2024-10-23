//
//  EkaRouter.swift
//  EkaPDFGenerator
//
//  Created by Arya Vashisht on 23/10/24.
//

import Foundation
import UIKit

enum EkaRouteOrigin {
  case apiCta
  case branchLink
  case fcm
  case webEngage
}

protocol EkaRouter: AnyObject {
  func getController(
    forPageId pageId: String,
    withParams params: Params?,
    withSyncId syncId: String?,
    originController: UIViewController?,
    _ completion: @escaping (UIViewController?, String?) -> Void
  )
}
