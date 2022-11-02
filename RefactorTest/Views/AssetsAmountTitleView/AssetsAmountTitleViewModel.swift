import Combine
import Foundation

class AssetsAmountTitleViewModel: ObservableObject {
    @Published var title: String
    @Published var subtitle: String

    private var cancelable = Set<AnyCancellable>()

    init(title: String = "", subtitle: String = "") {
        self.title = title
        self.subtitle = subtitle
    }

    convenience init(appState: AppState) {
        self.init()
        appState.$selected
            .receive(on: RunLoop.main)
            .map { $0.segmentTitle }
            .assign(to: &$title)
        appState.$selected
            .receive(on: RunLoop.main)
            .zip(appState.portfolioSegmentDataSource.$assetTotalAmount, appState.bitcoinPriceSegmentDataSource.$assetTotalAmount)
            .map { (segment, portfolioAssetTotal, bitcoinPriceTotal) -> String in
                switch segment {
                case .bitcoinPrice: return bitcoinPriceTotal
                case .portfolio: return portfolioAssetTotal
                }
            }
            .assign(to: &$subtitle)
    }
}
