import Combine
import SwiftUI

class BitcoinPriceSegmentDataSource: ObservableObject, GenericAssetDataSourceProtocol {
    @Published var assetTotalAmount: String
    @Published var assetChangeAmount: String
    @Published var assetChangePercentage: String
    @Published var assetChangeDirectionality: StockDirection

    private static let defaultCurrenyAmount = "£0.00"

    init(assetTotalAmount: String = defaultCurrenyAmount,
         assetChangeAmount: String = defaultCurrenyAmount,
         assetChangePercentage: String = "0.00",
         assetChangeDirectionality: StockDirection = .noChange)
    {
        self.assetTotalAmount = assetTotalAmount
        self.assetChangeAmount = assetChangeAmount
        self.assetChangePercentage = assetChangePercentage
        self.assetChangeDirectionality = assetChangeDirectionality
    }
}

