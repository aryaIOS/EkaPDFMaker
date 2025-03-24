//
//  PDFPreviewScreen.swift
//  EkaPDFMaker
//
//  Created by Arya Vashisht on 24/03/25.
//


import SwiftUI
import PDFKit

public struct PDFPreviewScreen: View {
  @State private var pdfURL: URL?
  @State private var headerHeight: CGFloat = 0
  @State private var bodyHeight: CGFloat = 0
  
  public var headerView: AnyView?
  public var bodyView: AnyView
  
  public init(
    headerView: AnyView? = nil,
    bodyView: AnyView
  ) {
    self.headerView = headerView
    self.bodyView = bodyView
  }
  
  public var body: some View {
    VStack(spacing: 0) {
      HStack {
        Spacer()
        Button(action: sharePDF) {
          Image(systemName: "square.and.arrow.up")
            .padding()
        }
      }
      .background(Color.white)
      
      if let headerView = headerView {
        GeometryReader { geometry in
          headerView
            .background(GeometryReader { geo in
              Color.clear
                .onAppear {
                  headerHeight = geo.size.height
                }
            })
        }
        .frame(height: headerHeight)
      }
      
      GeometryReader { geometry in
        bodyView
          .background(GeometryReader { geo in
            Color.clear
              .onAppear {
                bodyHeight = geo.size.height
              }
          })
      }
      .frame(height: bodyHeight)
    }
    .onAppear {
      generatePDF()
    }
  }
  
  private func generatePDF() {
    let pdfDocument = PDFDocument()
    let pdfPage = PDFPage(image: renderAsImage())
    pdfDocument.insert(pdfPage!, at: 0)
    
    let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("preview.pdf")
    pdfDocument.write(to: tempURL)
    pdfURL = tempURL
  }
  
  private func renderAsImage() -> UIImage {
    let hostingController = UIHostingController(rootView: self.body)
    let targetSize = CGSize(width: UIScreen.main.bounds.width, height: headerHeight + bodyHeight)
    hostingController.view.bounds = CGRect(origin: .zero, size: targetSize)
    hostingController.view.backgroundColor = .clear
    
    let renderer = UIGraphicsImageRenderer(size: targetSize)
    return renderer.image { _ in
      hostingController.view.drawHierarchy(in: hostingController.view.bounds, afterScreenUpdates: true)
    }
  }
  
  private func sharePDF() {
    guard let pdfURL = pdfURL else { return }
    let activityController = UIActivityViewController(activityItems: [pdfURL], applicationActivities: nil)
    if let topController = UIApplication.shared.windows.first?.rootViewController {
      topController.present(activityController, animated: true, completion: nil)
    }
  }
}

struct PDFPreviewScreen_Previews: PreviewProvider {
  static var previews: some View {
    PDFPreviewScreen(
      headerView: AnyView(Text("Header").frame(maxWidth: .infinity).background(Color.gray)),
      bodyView: AnyView(Text("Body").frame(maxWidth: .infinity).background(Color.white))
    )
  }
}
