import Combine

class PorfolioSegmentDataSource: ObservableObject, GenericAssetDataSourceProtocol {
    
    enum Subsections: String, CaseIterable {
        case invested = "Contributions"
        case interest = "Interest"
        case `return` = "All time return"
    }
    
    private static let defaultCurrenyAmount = "£0.00"

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
