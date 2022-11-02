import Foundation

enum AssetSegmentControl: CaseIterable {
    case portfolio
    case bitcoinPrice
}

extension AssetSegmentControl {
    var segmentTitle: String {
        switch self {
        case .portfolio:
            return "Your Bitcoin"
        case .bitcoinPrice:
            return "Bitcoin Price"
        }
    }

    var amountTitle: String {
        switch self {
        case .portfolio:
            return "Current Value"
        case .bitcoinPrice:
            return "Bitcoin Price"
        }
    }

    // Note: Function is not referenced, flagged for removal pending approval
    func amountOnTitle(formattedDate: String) -> String {
        switch self {
        case .portfolio:
            return "Value on \(formattedDate)"
        case .bitcoinPrice:
            return "Bitcoin Price on \(formattedDate)"
        }
    }
}
