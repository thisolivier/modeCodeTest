//
//  ContentViewModel.swift
//  RefactorTest
//
//  Created by Olivier Butler on 01/11/2022.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {

    @Published var selected: AssetSegmentControl

    init(selected: AssetSegmentControl = .portfolio) {
        self.selected = .portfolio
    }

    convenience init(appState: AppState) {
        self.init()
        selected = appState.selected
        $selected.assign(to: &appState.$selected)
    }
}
