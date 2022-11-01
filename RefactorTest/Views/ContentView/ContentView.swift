import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            assetSelector
            AssetsAmountTitleView(viewModel: )
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
}