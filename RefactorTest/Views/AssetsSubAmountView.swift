import SwiftUI

class PortfolioSubAmountViewModel: ObservableObject {
    @Published var sections: []
}

struct PortfolioSubAmount {
    var title: String
    var content: PortfolioSubAmountContent
}

struct PortfolioSubAmountContent {
    var text: String
    var colour: Color
    var image: Image
}



struct AssetsSubAmountView: View {
    @Binding var bitcoinPriceSegmentDataSource: BitcoinPriceSegmentDataSource
    @Binding var portfolioSegmentDataSource: PorfolioSegmentDataSource
    
    let assetSegment: AssetSegmentControl

    var body: some View {
        generateSubAmountSection()
    }

    // MARK: - Sub Amount Differential section
    @ViewBuilder
    private func generateSubAmountSection() -> some View {
        switch assetSegment {
        case .bitcoinPrice:
            generateBitcoinPriceSubAmountSection()
        case .portfolio:
            generatePortfolioSubAmountSection()
        }
    }

    // MARK: Bitcoin SubAmount Generators
    @ViewBuilder
    private func generateBitcoinPriceSubAmountSection() -> some View {
        VStack(
            alignment: .leading,
            spacing: 7
        ) {
            // TODO: Why a VStack with one element?
            genericSubAmountWithImage(
                amountFiat: bitcoinPriceSegmentDataSource.assetChangeAmount,
                amountPercentage: bitcoinPriceSegmentDataSource.assetChangePercentage,
                stockDirection: bitcoinPriceSegmentDataSource.assetChangeDirectionality
            )
        }
    }

    // MARK: Porfolio SubAmount Generators
    @ViewBuilder
    private func generatePortfolioSubAmountSection() -> some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack(alignment: .center, spacing: 20) {
                generatePortfolioSubAmounts()
            }
        }
    }


    @ViewBuilder
    private func generatePortfolioSubAmounts() -> some View {
        ForEach(0 ..< portfolioSegmentDataSource.porfolioSubAmountTitles.count) { index in
            VStack(alignment: .leading, spacing: 7) {
                // Main Title
                let title = portfolioSegmentDataSource.porfolioSubAmountTitles[index]
                Text(title)
                    .font(.caption)
                // TODO: Fix this, 
                if let subtype = PorfolioSubAmountTitle(rawValue: title) {
                    // Sub Amount Value
                    generateSubAmount(for: subtype)
                }
            }
        }
    }

    @ViewBuilder
    private func generateSubAmount(for portfolioSubType: PorfolioSubAmountTitle) -> some View {
        switch portfolioSubType {
        case .invested:
            genericSubAmount(for: portfolioSegmentDataSource.investedAmount)
        case .interest:
            genericSubAmount(for: portfolioSegmentDataSource.interestAmount,
                             with: portfolioSegmentDataSource.interestAmountDirectionality)
        case .return:
            genericSubAmountWithImage(
                amountFiat: portfolioSegmentDataSource.returnAmount,
                amountPercentage: portfolioSegmentDataSource.returnAmountPercentage,
                stockDirection: portfolioSegmentDataSource.returnAmountDirectionality
            )
        }
    }

    // MARK: Generic SubAmount Generators
    // NOTE: Olivier - A lot of this is presentational logic/interface adapters. It is not layout logic, which the view layer should be focusing on.
    // Presentational logic should be moved to the view model's initialiser.

    private func genericSubAmount(for amount: String) -> Text {
        Text(amount)
            .font(.callout)
    }

    private func genericSubAmount(
        for amount: String,
        with stockDirection: StockDirection
    ) -> Text {
        genericColoredSubAmountLabel(for: amount,
                                     with: stockDirection)
    }

    private func genericSubAmountWithImage(
        amountFiat: String,
        amountPercentage: String,
        stockDirection: StockDirection
    ) -> some View {
        HStack(alignment: .center, spacing: nil) {
            // Image
            graphDirectionalityImage(stockDirection: stockDirection)
            // Label
            let label = amountFiat + " (\(amountPercentage)%)"
            genericColoredSubAmountLabel(for: label,
                                         with: stockDirection)
        }
    }

    private func genericColoredSubAmountLabel(
        for amount: String,
        with stockDirection: StockDirection
    ) -> Text {
        Text(amount)
            .font(.callout)
            .foregroundColor(graphDirectionalityColor(stockDirection: stockDirection))
    }

    // MARK: Graph Decorators

    private func graphDirectionalityImage(stockDirection: StockDirection) -> Image {
        switch stockDirection {
        case .decrease: return Image(systemName: "arrow.down.right")
        case .increase: return Image(systemName: "arrow.up.right")
        case .noChange: return Image(systemName: "circlebadge.fill")
        }
    }

    private func graphDirectionalityColor(stockDirection: StockDirection) -> Color {
        switch stockDirection {
        case .increase:
            return .green
        case .decrease:
            return .red
        case .noChange:
            return .gray
        }
    }
}

struct AssetsSubAmountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AssetsSubAmountView(
                bitcoinPriceSegmentDataSource: .constant(.init()),
                portfolioSegmentDataSource: .constant(.init()),
                assetSegment: .portfolio
            )
            AssetsSubAmountView(
                bitcoinPriceSegmentDataSource: .constant(.init()),
                portfolioSegmentDataSource: .constant(.init()),
                assetSegment: .bitcoinPrice
            )
        }
        .previewLayout(.sizeThatFits)
    }
}
