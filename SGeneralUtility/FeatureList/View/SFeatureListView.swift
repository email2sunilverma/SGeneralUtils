//
//  SFeatureListView.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI


enum SFeature: Int, CaseIterable {
    case stack
    case queue
    case linkList
    case imageToText
    case api
    
    var displayName: String {
        switch self {
        case .stack:
            return "Stack"
        case .queue:
            return "Queue"
        case .linkList:
            return "Linked List"
        case .imageToText:
            return "Image To Text"
        case .api:
            return "API"
       
        }
    }
    
    func destinationView() -> AnyView {
            switch self {
            case .stack:
                return AnyView(SStackView(viewModel: SStackViewModel()))
            case .queue:
                return AnyView(SQueueView(viewModel: SQueueViewModel()))
            case.api:
                return AnyView(SEmployeeListView())
            case .imageToText:
                return AnyView(SImageProcessView())
            default:
                return AnyView(SLinkedListView(viewModel: SLinkListViewModel()))
            }
        }
}

struct SFeatureListView: View {
    private let viewModel:SFeatureViewModel = SFeatureViewModel()
    var body: some View {
        NavigationView {
        VStack {
            HStack{
                SNavLabel(text: .constant("Feature"))
            }.padding(.horizontal)
            
                List{
                    ForEach(viewModel.festures ?? [],id: \.self) { item in
                        NavigationLink {
                            SLazyView {
                                item.destinationView()
                            }
                        } label: {
                            SFeatureRow(item: item)
                        }

                    }
                }.listStyle(.plain)
                    .background(.white)
            }.background(Color("appNavBarColor"))
        }
    }
}

struct SFeatureListView_Previews: PreviewProvider {
    static var previews: some View {
        SFeatureListView()
    }
}
