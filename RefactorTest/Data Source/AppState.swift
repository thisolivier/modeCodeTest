import Combine
import Foundation

class AppState: ObservableObject {
    static var shared: AppState = AppState()

    @Published var selected: AssetSegmentControl
    @Published var portfolioSegmentDataSource: PorfolioSegmentDataSource
    @Published var bitcoinPriceSegmentDataSource: BitcoinPriceSegmentDataSource
    
    init() {
        self.selected = .portfolio
        self.portfolioSegmentDataSource = PorfolioSegmentDataSource()
        self.bitcoinPriceSegmentDataSource = BitcoinPriceSegmentDataSource()
    }
}

