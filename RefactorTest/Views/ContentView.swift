import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    private let segmentControlsDataSrc = [
        AssetSegmentControl.portfolio.segmentTitle(),
        AssetSegmentControl.bitcoinPrice.segmentTitle()
    ]
    
    var body: some View {
        VStack {
            assetSelector
            AssetsAmountTitleView(
                selectedAsset: $viewModel.selected,
                bitcoinPriceDataSource: $viewModel.bitcoinPriceSegmentDataSource,
                portfolioDataSource: $viewModel.portfolioSegmentDataSource
            )
            Spacer()
        }
    }
    
    var assetSelector: some View {
        Picker(
            selection: $viewModel.selected,
            label: Text("Select an Asset")
        ) {
            // TODO: [OLIVIER] Why have dynamic picker with static data sources?
            ForEach(0 ..< segmentControlsDataSrc.count) { index in
                Text(self.segmentControlsDataSrc[index])
                    .tag(AssetSegmentControl(rawValue: index)!)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}
