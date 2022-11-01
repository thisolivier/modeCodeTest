import Foundation

enum AssetSegmentControl: Int {
    case portfolio = 0
    case bitcoinPrice = 1

    func segmentDeterminator(controlSection: Int) -> AssetSegmentControl {
        if controlSection == 0 {
            return .portfolio
        } else if controlSection == 1 {
            return .bitcoinPrice
        }
        return .portfolio
    }

    func controlSection() -> Int {
        switch self {
        case .portfolio:
            return 0
        case .bitcoinPrice:
            return 1
        }
    }

    func segmentTitle() -> String {
        switch self {
        case .portfolio:
            return "Your Bitcoin"
        case .bitcoinPrice:
            return "Bitcoin Price"
        }
    }

    func amountTitle() -> String {
        switch self {
        case .portfolio:
            return "Current Value"
        case .bitcoinPrice:
            return "Bitcoin Price"
        }
    }
    
    func amountOnTitle(formattedDate: String) -> String {
        switch self {
        case .portfolio:
            return "Value on \(formattedDate)"
        case .bitcoinPrice:
            return "Bitcoin Price on \(formattedDate)"
        }
    }
}
