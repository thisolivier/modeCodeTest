//
//  AssetValueDescriptionViewModel.swift
//  RefactorTest
//
//  Created by Olivier Butler on 01/11/2022.
//

import SwiftUI

struct AssetValueDescriptionViewModel: Equatable {
    var text: String
    var colour: Color?
    var image: Image?

    static func globalBitcoinValueDescription(_ appState: AppState = .shared) -> AssetValueDescriptionViewModel {
        let changeAmount = appState.bitcoinPriceSegmentDataSource.assetChangeAmount
        let changePercentage = appState.bitcoinPriceSegmentDataSource.assetChangePercentage
        let direction = appState.bitcoinPriceSegmentDataSource.assetChangeDirectionality
        return AssetValueDescriptionViewModel(
            text: changeAmount + " (\(changePercentage)%)",
            colour: direction.color,
            image: direction.image
        )
    }
}
