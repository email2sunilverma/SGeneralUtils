//
//  SFeatureViewModel.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation
import SwiftUI

class SFeatureViewModel: ObservableObject {
   @Published var festures:[SFeature]?
    init() {
        self.festures = SFeature.allCases
    }
}
