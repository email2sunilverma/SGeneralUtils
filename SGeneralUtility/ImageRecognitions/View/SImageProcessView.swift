//
//  SImageProcessView.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 29/05/24.
//

import SwiftUI

struct SImageProcessView: View {
    @State private var imageText: String = ""

    var body: some View {
        VStack {
            SButton(action: {
                if let image = UIImage(named: "EmailImg") {
                    SImageProcessor.processImage(image: image) { results in
                        if let text = results?.joined(separator: ", ") {
                            imageText = text
                        }
                    }
                }
            }, label: "Process Image")
            
            SButton(action: {
                Task {
                    if let image = UIImage(named: "ImageWithText") {
                        let results = try? await SImageProcessor.processImage(in: image)
                        if let text = results?.joined(separator: ", ") {
                            imageText = text
                        }
                    }
                }
            }, label: "Process Async Image")
            SBindLabel(text: $imageText)
        }
    }
}

struct SImageProcessView_Previews: PreviewProvider {
    static var previews: some View {
        SImageProcessView()
    }
}
