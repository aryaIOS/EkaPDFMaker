// Created on 16/10/24. Copyright © 2022 Orbi Health Private Limited. All rights reserved.

import PDFKit
import SwiftUI
import Foundation

public enum PageSizing {
  case a4
  
  public var pageSize: CGSize {
    switch self {
    case .a4:
      return CGSize(width: 595.2 , height: 841.8)
    }
  }
}

public enum UrlPath {
  public static let url = "\(UUID().uuidString).pdf"
}

@MainActor
@available(iOS 16.0, *)
public struct PDFRenderer {
  
  public init() {
    
  }
  /// Used to render
  /// - Parameter view: The SwiftUI View that you want to be rendered
  /// - Parameter urlPathString:The path at which the pdf is to be updated
  /// - Returns: Returns the URL at which the pdf was updated
//  func renderMultiplePages(
//    urlPathString: String = UrlPath.url,
//    view: Content
//  ) -> URL {
//    let pageSize = PageSizing.a4.pageSize
//    let renderer = ImageRenderer(content: view)
//    let url = URL.documentsDirectory.appending(path: UrlPath.url)
//    
//    renderer.render { size, context in
//      let pageSize = PageSizing.a4.pageSize
//      /// Current y position of the pdf renderer
//      var currentY: CGFloat = 0
//      /// Current page number at which the pdf renderer is
//      var currentPageNumber = 1
//      /// Page size
//      var box = CGRect(x: 0, y: 0, width: pageSize.width, height: pageSize.height)
//      
//      /// Create the CGContext for our PDF pages
//      guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
//        return
//      }
//      
//      /// Start rendering the content for each page in loop
//      while currentY < size.height {
//        
//        let numberOfCutFrames = size.height / pageSize.height
//        
//        /// For page to show clipping from the start.
//        /// By default the box cuts from the bottom of the view
//        let translateValue: CGFloat = CGFloat(numberOfCutFrames - CGFloat(currentPageNumber)) * (pageSize.height)
//        
//        /// Begin new pdf page
//        pdf.beginPDFPage(nil)
//        
//        /// Save the graphics state before translating
//        pdf.saveGState()
//        
//        /// Translate the original content by -y
//        pdf.translateBy(x: 0, y: -translateValue)
//        
//        /// Render the view on the page
//        context(pdf)
//        
//        /// Restore the graphics state to prevent cumulative translations
//        pdf.restoreGState()
//        
//        /// End the current page
//        pdf.endPDFPage()
//        
//        /// Move the currentY position forward by the page height
//        currentY += pageSize.height
//        /// Move Current page number to next
//        currentPageNumber += 1
//      }
//      
//      /// Close the PDF file
//      pdf.closePDF()
//    }
//    
//    return url
//  }
  
  public func renderSinglePageWithoutA4Constraints(
    urlPathString: String = UrlPath.url,
    headerView: AnyView = AnyView(
      DTPDFHeaderView(
        data: DTPDFHeaderViewData.formDeepthoughtHeaderViewData(
          doctorName: "Dr. Kunal Katre",
          clinicName: "Kunal's clinic",
          address: "Bangalore"
        )
      )
    ),
    bodyView: AnyView
  ) -> URL {
    let width = PageSizing.a4.pageSize.width
    let headerHeight = calculateHeight(for: AnyView(headerView), givenWidth: width)
    let bodyHeight = calculateHeight(for: AnyView(bodyView), givenWidth: width)
    let height = headerHeight + bodyHeight
    
    // Create an ImageRenderer for both the header and the content
    let headerRenderer = ImageRenderer(
      content: headerView.scaleEffect( /// To flip view upside down
        x: 1,
        y: -1,
        anchor: .center
      )
    )
    
    let bodyRenderer = ImageRenderer(
      content: bodyView.scaleEffect( /// To flip view upside down
        x: 1,
        y: -1,
        anchor: .center
      )
    )
    
    let url = URL.documentsDirectory.appending(path: urlPathString)
    if let consumer = CGDataConsumer(url: url as CFURL),
       let context = CGContext(consumer: consumer, mediaBox: nil, nil) {
      
      /// By default the media box renders items at the bottom
      var mediaBox = CGRect(origin: .init(x: 0, y: 0), size: CGSize(width: width, height: height))
      context.beginPage(mediaBox: &mediaBox)
      /// Save the state
      context.saveGState()
      
      /// Transformation of the coordinate system
      /// Note however this will render the contents upside down
      /// You have to flip the views beforehand to ensure the coordinates are correct
      context.translateBy(x: 0, y: height) /// Move the items up
      context.scaleBy(x: 1, y: -1) /// Flip the scale
      
      /// Render the header at the top
      headerRenderer.render { size, renderer in
        renderer(context)
      }
      
      context.translateBy(x: 0, y: headerHeight)
      
      bodyRenderer.render { size, renderer in
        renderer(context)
      }
      
      // Restore and close the PDF context
      context.restoreGState()
      context.endPDFPage()
      context.closePDF()
      
    }
    return url
  }
  
  public func renderSinglePage(
    urlPathString: String = UrlPath.url,
    headerView: AnyView = AnyView(DTPDFHeaderView(data: DTPDFHeaderViewData.formDeepthoughtHeaderViewData(
      doctorName: "Dr. Kunal Katre",
      clinicName: "Kunal's clinic",
      address: "Bangalore"
    ))),
    bodyView: AnyView
  ) -> URL {
    let pageSize = PageSizing.a4.pageSize
    // TODO: - Arya break this to separate function
    /// 2: Save the rendered content to the documents directory
    let url = URL.documentsDirectory.appending(path: urlPathString)
    let bodyHeight = calculateHeight(for: bodyView, givenWidth: pageSize.width)
    
    print("Body height is \(bodyHeight)")
    
    /// Height of header
    let headerHeight = calculateHeight(for: AnyView(headerView), givenWidth: pageSize.width)
    
    /// Available height for the body
    let availableHeight = pageSize.height - headerHeight
    
    /// Scale down of the page
    let heightRatio = CGFloat( CGFloat(availableHeight) / CGFloat(bodyHeight))
    let scaleFactor = heightRatio < 1 ? heightRatio : 1
    
    print("Scale factor is \(scaleFactor)")
    
    // Create an ImageRenderer for both the header and the content
    let headerRenderer = ImageRenderer(
      content: headerView.scaleEffect( /// To flip view upside down
        x: 1,
        y: -1,
        anchor: .center
      )
    )
    
    let bodyRenderer = ImageRenderer(
      content: bodyView.scaleEffect( /// To flip view upside down
        x: 1,
        y: -1,
        anchor: .center
      )
      .scaleEffect( /// To scale down the body with respect to the page view
        x: scaleFactor,
        y: scaleFactor,
        anchor: .bottomLeading
      )
    )

    if let consumer = CGDataConsumer(url: url as CFURL),
       let context = CGContext(consumer: consumer, mediaBox: nil, nil) {
      
      /// By default the media box renders items at the bottom
      var mediaBox = CGRect(origin: .init(x: 0, y: 0), size: CGSize( width: pageSize.width, height: pageSize.height))
      context.beginPage(mediaBox: &mediaBox)
      /// Save the state
      context.saveGState()
      
      /// Transformation of the coordinate system
      /// Note however this will render the contents upside down
      /// You have to flip the views beforehand to ensure the coordinates are correct
      context.translateBy(x: 0, y: pageSize.height) /// Move the items up
      context.scaleBy(x: 1, y: -1) /// Flip the scale
      
      /// Render the header at the top
      headerRenderer.render { size, renderer in
        renderer(context)
      }
      
      context.translateBy(x: 0, y: headerHeight)
      
      bodyRenderer.render { size, renderer in
        renderer(context)
      }
      
      // Restore and close the PDF context
      context.restoreGState()
      context.endPDFPage()
      context.closePDF()
    }
    
    return url
  }
}

@MainActor
@available(iOS 16.0, *)
extension PDFRenderer {
  public func calculateHeight(for view: some View, givenWidth width: CGFloat) -> CGFloat {
    // 1. Create a UIHostingController with the SwiftUI view
    let hostingController = UIHostingController(rootView: view)
    
    // 2. Add the view to a temporary container for layout
    let targetSize = CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)
    
    // 3. Set the preferred content size or use systemLayoutSizeFitting to calculate the size
    let size = hostingController.view.systemLayoutSizeFitting(targetSize,
                                                              withHorizontalFittingPriority: .required,
                                                              verticalFittingPriority: .fittingSizeLevel)
    
    return size.height
  }
}
