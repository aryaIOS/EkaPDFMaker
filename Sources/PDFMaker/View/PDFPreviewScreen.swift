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
      ScrollView {
        headerView
        bodyView
      }
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
          .opacity(0)
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
        .opacity(0)
    }
    .onAppear {
      generatePDF()
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: sharePDF) {
          Image(systemName: "square.and.arrow.up")
        }
      }
    }
  }
  
  private func generatePDF() {
    let url = PDFRenderer().getPdfUrl(
      headerView: headerView,
      bodyView: bodyView,
      headerHeight: headerHeight,
      bodyHeight: bodyHeight
    )
    pdfURL = url
  }
  
  private func sharePDF() {
    guard let pdfURL else { return }
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
