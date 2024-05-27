//
//  SEmployeeListView.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SEmployeeListView: View {
   @StateObject private var viewModel:SEmployeeViewModel = SEmployeeViewModel()
    var body: some View {
        VStack {
            HStack{
                SNavLabel(text: .constant("Persons"))
            }.padding(.horizontal)
            
                List{
                    ForEach(viewModel.employees ?? [], id: \.id) { employee in
                        NavigationLink {
                            SLazyView {
                                SEmployeeDetailView(viewModel: SEmployeeDetailViewModel(employee: employee))
                            }
                        } label: {
                            SEmployeeRow(employee: employee)
                        }

                    }
                }.listStyle(.plain)
                    .background(.white)
            }.background(Color("appNavBarColor"))
            .onAppear() {
                viewModel.getEmployeeData()
            }
        }
    
}

struct SPersonListView_Previews: PreviewProvider {
    static var previews: some View {
        SEmployeeListView()
    }
}
