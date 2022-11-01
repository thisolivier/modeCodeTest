import Combine

class ContentViewModel: ObservableObject {
    @Published var selected: AssetSegmentControl
    
    @Published private var portfolioSegmentDataSource: PorfolioSegmentDataSource
    @Published private var bitcoinPriceSegmentDataSource: BitcoinPriceSegmentDataSource

    var otherViewModel: OtherViewModel {
        OtherViewModel(
            title: &selected.segmentTitle,
            subtitle: &portfolioSegmentDataSource.assetTotalAmount
        )
    }
    
    init() {
        self.selected = .portfolio
        self.portfolioSegmentDataSource = PorfolioSegmentDataSource()
        self.bitcoinPriceSegmentDataSource = BitcoinPriceSegmentDataSource()
    }
}

class OtherViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var subtitle: String = ""

    private var cancelable = Set<AnyCancellable>()

    init(title: inout Published<String>, subtitle: inout Published<String>) {
        title.projectedValue
            .sink { self.title = $0 }
            .store(in: &cancelable)
        subtitle.projectedValue
            .sink { self.subtitle = $0 }
            .store(in: &cancelable)
    }
}
