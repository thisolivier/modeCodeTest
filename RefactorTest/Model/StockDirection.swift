//
//  StockDirection.swift
//  RefactorTest
//
//  Created by Olivier Butler on 01/11/2022.
//

import Foundation
import SwiftUI

public enum StockDirection {
    case increase
    case noChange
    case decrease
}

extension StockDirection {
    var image: Image {
        switch self {
        case .decrease: return Image(systemName: "arrow.down.right")
        case .increase: return Image(systemName: "arrow.up.right")
        case .noChange: return Image(systemName: "circlebadge.fill")
        }
    }
}

extension StockDirection {
    var color: Color {
        switch self {
        case .increase:
            return .green
        case .decrease:
            return .red
        case .noChange:
            return .gray
        }
    }
}
