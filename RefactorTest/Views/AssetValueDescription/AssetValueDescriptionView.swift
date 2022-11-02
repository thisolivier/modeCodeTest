//
//  AssetValueDescription.swift
//  RefactorTest
//
//  Created by Olivier Butler on 01/11/2022.
//

import SwiftUI

struct AssetValueDescriptionView: View {
    var viewModel: AssetValueDescriptionViewModel

    var body: some View {
        constructAppropriateDescription()
    }

    @ViewBuilder
    func constructAppropriateDescription() -> some View {
        if let colour = viewModel.colour, let image = viewModel.image {
            genericSubAmountWithImage(color: colour, image: image)
        } else if let colour = viewModel.colour {
            genericColouredSubAmountLabel(colour)
        } else {
            Text(viewModel.text).font(.callout)
        }
    }

    private func genericColouredSubAmountLabel(
        _ colour: Color
    ) -> Text {
        Text(viewModel.text)
            .font(.callout)
            .foregroundColor(colour)
    }

    private func genericSubAmountWithImage(
        color: Color,
        image: Image
    ) -> some View {
        HStack(alignment: .center, spacing: nil) {
            image
            genericColouredSubAmountLabel(color)
        }
    }
}

struct AssetValueDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            AssetValueDescriptionView(viewModel: .init(text: "$12.34", colour: nil, image: nil))
            AssetValueDescriptionView(viewModel: .init(text: "€5.00", colour: .red, image: nil))
            AssetValueDescriptionView(viewModel: .init(text: "£88.34", colour: .green, image: StockDirection.decrease.image))
        }.previewLayout(.sizeThatFits)
    }
}
