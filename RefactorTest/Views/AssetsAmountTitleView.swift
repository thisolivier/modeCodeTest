import SwiftUI

struct AssetsAmountTitleView: View {
    @Binding var selectedAsset: AssetSegmentControl
    @Binding var bitcoinPriceDataSource: BitcoinPriceSegmentDataSource
    @Binding var portfolioDataSource: PorfolioSegmentDataSource
    
    var body: some View {
        HStack {
            amountView()
                .padding(.leading, 7)
            Spacer()
        }
        .padding(.leading, 30)
        .padding(.top, 7)
    }
    
    private func amountView() -> some View {
        VStack(alignment: .leading, spacing: 15) {
            titleSection()
            constructAssetsSubAmountView()
        }
    }
    
    // MARK: - Amount Title section
    
    private func titleSection() -> some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(constructAmountTitle())
                .font(.title)
            Text(amountValue())
                .font(.title2)
        }
    }
    
    private func amountValue() -> String {
        switch selectedAsset {
        case .bitcoinPrice:
            return bitcoinPriceDataSource.assetTotalAmount
        case .portfolio:
            return portfolioDataSource.assetTotalAmount
        }
    }
    
    private func constructAmountTitle() -> String {
        return selectedAsset.amountTitle()
    }
    
    private func constructAssetsSubAmountView() -> AssetsSubAmountView {
        AssetsSubAmountView(bitcoinPriceSegmentDataSource: $bitcoinPriceDataSource,
                                  portfolioSegmentDataSource: $portfolioDataSource,
                                  assetSegment: selectedAsset)
    }
}
