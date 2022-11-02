import SwiftUI

struct PortfolioAssetsView: View {
    var viewModel: PortfolioAssetsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack(alignment: .center, spacing: 20) {
                generatePortfolioSubAmounts()
            }
        }
    }

    @ViewBuilder
    private func generatePortfolioSubAmounts() -> some View {
        ForEach(viewModel.components, id: \.title) { component in
            VStack(alignment: .leading, spacing: 7) {
                Text(component.title)
                    .font(.caption)
                AssetValueDescriptionView(viewModel: .init(
                    text: component.content.text,
                    colour: component.content.colour,
                    image: component.content.image)
                )
            }
        }
    }
}

struct AssetsSubAmountView_Previews: PreviewProvider {
    static var previews: some View {
        let components: [PortfolioAssetComponents] = [
            .init(title: "Title One", content: .init(text: "Hiya")),
            .init(title: "The Second Title", content: .init(text: "This is some test text", colour: .blue)),
            .init(title: "3", content: .init(text: "Hiya"))
        ]
        PortfolioAssetsView(viewModel: .init(components: components)).previewLayout(.sizeThatFits)
    }
}
