//
//  SFeatureRow.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SFeatureRow: View {
    let item: SFeature
    var body: some View {
        HStack {
            SLabel(text: item.displayName)
        }.padding(.horizontal)
        
    }
}

struct SFeatureRow_Previews: PreviewProvider {
    static var previews: some View {
        SFeatureRow(item: .queue)
    }
}
