import SwiftUI

struct AssetsAmountTitleView: View {

    @ObservedObject var viewModel: OtherViewModel

//    @Binding var selectedAsset: AssetSegmentControl
//    @Binding var bitcoinPriceDataSource: BitcoinPriceSegmentDataSource
//    @Binding var portfolioDataSource: PorfolioSegmentDataSource
    
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
            //constructAssetsSubAmountView()
        }
    }
    
    // MARK: - Amount Title section
    
    private func titleSection() -> some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(viewModel.title)
                .font(.title)
            Text(viewModel.subtitle)
                .font(.title2)
        }
    }
    
//    private func constructAssetsSubAmountView() -> AssetsSubAmountView {
//        AssetsSubAmountView(
//            bitcoinPriceSegmentDataSource: $bitcoinPriceDataSource,
//            portfolioSegmentDataSource: $portfolioDataSource,
//            assetSegment: selectedAsset
//        )
//    }
}

//struct AssetsAmountTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            AssetsAmountTitleView(
//                selectedAsset: .constant(AssetSegmentControl.bitcoinPrice),
//                bitcoinPriceDataSource: .constant(.init()),
//                portfolioDataSource: .constant(.init())
//            )
//            AssetsAmountTitleView(
//                selectedAsset: .constant(AssetSegmentControl.portfolio),
//                bitcoinPriceDataSource: .constant(.init()),
//                portfolioDataSource: .constant(.init())
//            )
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}