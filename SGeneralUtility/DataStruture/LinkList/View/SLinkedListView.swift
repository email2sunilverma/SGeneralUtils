//
//  SLinkedListView.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SLinkedListView: View {
    let viewModel:  SLinkListViewModel
    @State private var queueItem: String = ""
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                SButton(action: {
                    self.viewModel.insertAtLast(item: Int.random(in: 0...100))
                    queueItem = viewModel.displayItems()

                }, label: "Insert at Last")
                
                SButton(action: {
                   _ = self.viewModel.removeLastItem()
                    queueItem = viewModel.displayItems()
                }, label: "Remove at Last")
            }
            
            HStack {
                SButton(action: {
                    
                   try? self.viewModel.insertItemAt(item: Int.random(in: 0...100), index: Int.random(in: 0...5))
                    queueItem = viewModel.displayItems()

                }, label: "Insert at Index")
                
                SButton(action: {
                 _ =  try? self.viewModel.removeItemAt(index: Int.random(in: 0...5))
                    queueItem = viewModel.displayItems()
                }, label: "Remove at Index")
            }
            SBindLabel(text: $queueItem)

        }.padding(.all)
    }
}

struct SLinkedListView_Previews: PreviewProvider {
    static var previews: some View {
        SLinkedListView(viewModel: SLinkListViewModel())
    }
}
