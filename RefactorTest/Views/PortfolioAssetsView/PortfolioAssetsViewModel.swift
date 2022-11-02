//
//  PortfolioAssetsViewModel.swift
//  RefactorTest
//
//  Created by Olivier Butler on 01/11/2022.
//

import SwiftUI

struct PortfolioAssetComponents {
    var title: String
    var content: AssetValueDescriptionViewModel
}

struct PortfolioAssetsViewModel {
    var components: [PortfolioAssetComponents]

    init(components: [PortfolioAssetComponents]) {
        self.components = components
    }

    init(_ appState: AppState) {
        let portfolioData = appState.portfolioSegmentDataSource
        components = PorfolioSegmentDataSource.Subsections.allCases.map { subsection in
            let title: String = subsection.rawValue
            let content: AssetValueDescriptionViewModel
            switch subsection {
            case .return:
                let amountFiat = portfolioData.returnAmount
                let amountPercentage = portfolioData.returnAmountPercentage
                content = AssetValueDescriptionViewModel(
                    text: amountFiat + " (\(amountPercentage)%)",
                    colour: portfolioData.returnAmountDirectionality.color,
                    image: portfolioData.returnAmountDirectionality.image
                )
            case .interest:
                content = AssetValueDescriptionViewModel(
                    text: portfolioData.interestAmount,
                    colour: portfolioData.interestAmountDirectionality.color
                )
            case .invested:
                content = AssetValueDescriptionViewModel(text: portfolioData.investedAmount)
            }
            return PortfolioAssetComponents(title: title, content: content)
        }
    }
}
