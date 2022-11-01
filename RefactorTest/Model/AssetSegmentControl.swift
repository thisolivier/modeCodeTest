import Foundation

// TODO: This is not a view, should not be in with the views. This is a application level model.
enum AssetSegmentControl: CaseIterable {
    // TODO: [OLIVIER] In connection with ContentView: 28, we have a hard coded number of sections.
    case portfolio //= 0
    case bitcoinPrice //= 1

    func segmentDeterminator(controlSection: Int) -> AssetSegmentControl {
        if controlSection == 0 {
            return .portfolio
        } else if controlSection == 1 {
            return .bitcoinPrice
        }
        return .portfolio
    }

    var controlSection: Int {
        switch self {
        case .portfolio:
            return 0
        case .bitcoinPrice:
            return 1
        }
    }

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
    
    func amountOnTitle(formattedDate: String) -> String {
        switch self {
        case .portfolio:
            return "Value on \(formattedDate)"
        case .bitcoinPrice:
            return "Bitcoin Price on \(formattedDate)"
        }
    }
}
