//
//  SQueueView.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SQueueView: View {
    let viewModel:  SQueueViewModel
    @State private var queueItem: String = ""
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                SButton(action: {
                   self.viewModel.enqueue(item: Int.random(in: 0...100))
                    queueItem = viewModel.displayQueue()

                }, label: "Enqueue Item")
                
                SButton(action: {
                  _ =  viewModel.dequeue()
                    queueItem = viewModel.displayQueue()
                }, label: "Dequeue Item")
            }
            SBindLabel(text: $queueItem)

        }.padding(.all)
    }
}

struct SQueueView_Previews: PreviewProvider {
    static var previews: some View {
        SQueueView(viewModel: SQueueViewModel())
    }
}
