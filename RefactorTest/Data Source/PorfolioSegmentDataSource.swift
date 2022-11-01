import Combine

// TODO: This enum is being used in very stange ways, see line 25 here, and generatePortfolioSubAmounts in AssetSubAmountView
enum PorfolioSubAmountTitle: String {
    case invested = "Contributions"
    case interest = "Interest"
    case `return` = "All time return"
}

class PorfolioSegmentDataSource: ObservableObject, GenericAssetDataSourceProtocol {
    @Published var assetTotalAmount: String
    // Invested Amount
    @Published var investedAmount: String
    // Interest Amount
    @Published var interestAmount: String
    @Published var interestAmountDirectionality: StockDirection
    // Return Amount
    @Published var returnAmount: String
    @Published var returnAmountPercentage: String
    @Published var returnAmountDirectionality: StockDirection

    // Title Strings
    // TODO: Deduplicate this from the portifolio amount titles.
    // Note: Is never modified, does not need to be published.
    @Published var porfolioSubAmountTitles = ["Contributions", "Interest", "All time return"]

    private static let defaultCurrenyAmount = "£0.00"

    init(assetTotalAmount: String = defaultCurrenyAmount,
         investedAmount: String = defaultCurrenyAmount,
         interestAmount: String = defaultCurrenyAmount,
         interestAmountDirectionality: StockDirection = .noChange,
         returnAmount: String = defaultCurrenyAmount,
         returnAmountDirectionality: StockDirection = .noChange,
         returnAmountPercentage: String = "0.00")
    {
        self.assetTotalAmount = assetTotalAmount
        self.investedAmount = investedAmount
        self.interestAmount = interestAmount
        self.returnAmount = returnAmount
        self.interestAmountDirectionality = interestAmountDirectionality
        self.returnAmountDirectionality = returnAmountDirectionality
        self.returnAmountPercentage = returnAmountPercentage
    }
}
