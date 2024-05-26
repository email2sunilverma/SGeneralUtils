//
//  SStackView.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SStackView: View {
    let viewModel:  SStackViewModel
    @State private var stackItem: String = ""
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                SButton(action: {
                   self.viewModel.push(item: Int.random(in: 0...100))
                    stackItem = viewModel.displayStack()

                }, label: "Push Item")
                
                SButton(action: {
                  _ =  viewModel.pop()
                    stackItem = viewModel.displayStack()
                }, label: "POP Item")
            }
            
           
            SBindLabel(text: $stackItem)

        }.padding(.all)
    }
}

struct SStackView_Previews: PreviewProvider {
    static var previews: some View {
        SStackView(viewModel: SStackViewModel())
    }
}
