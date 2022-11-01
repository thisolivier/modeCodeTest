import Combine

class ViewModel: ObservableObject {
    @Published var selected: AssetSegmentControl
    
    @Published var portfolioSegmentDataSource: PorfolioSegmentDataSource
    @Published var bitcoinPriceSegmentDataSource: BitcoinPriceSegmentDataSource

    
    init() {
        self.selected = .portfolio
        self.portfolioSegmentDataSource = PorfolioSegmentDataSource()
        self.bitcoinPriceSegmentDataSource = BitcoinPriceSegmentDataSource()
    }
}
