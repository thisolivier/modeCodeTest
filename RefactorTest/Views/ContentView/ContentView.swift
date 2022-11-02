import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    let appState: AppState
    
    var body: some View {
        VStack {
            // Picker
            assetSelector
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    // Title & Subtitle
                    AssetsAmountTitleView(viewModel: .init(appState: appState))
                    // Main body
                    constructAssetsSubAmountView()
                }
                .padding(.leading, 7)
                Spacer()
            }
            .padding(.leading, 30)
            .padding(.top, 7)
            Spacer()
        }
    }
    
    var assetSelector: some View {
        Picker(
            selection: $viewModel.selected,
            label: Text("Select an Asset")
        ) {
            ForEach (AssetSegmentControl.allCases, id: \.self) { segment in
                Text(segment.segmentTitle)
                    .tag(segment)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }

    @ViewBuilder
    private func constructAssetsSubAmountView() -> some View {
        switch $viewModel.selected.wrappedValue {
        case .portfolio:
            PortfolioAssetsView(viewModel: .init(_: appState))
        case .bitcoinPrice:
            AssetValueDescriptionView(viewModel: .globalBitcoinValueDescription(_: appState))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // TODO: Replace .shared with a mock
        ContentView(
            viewModel: .init(appState: .shared),
            appState: .shared
        )
    }
}
