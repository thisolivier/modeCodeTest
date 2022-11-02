import SwiftUI

struct AssetsAmountTitleView: View {
    @ObservedObject var viewModel: AssetsAmountTitleViewModel
    
    var body: some View {
        titleSection()
    }
    
    // MARK: - Amount Title section
    
    private func titleSection() -> some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(viewModel.title)
                .font(.title)
            Text(viewModel.subtitle)
                .font(.title2)
        }
    }
}

struct AssetsAmountTitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AssetsAmountTitleView(viewModel: .init(title: "Test Title", subtitle: "$12.99"))
            AssetsAmountTitleView(
                viewModel: .init(title: "Bonus", subtitle: "$3121009.44")
            )
            .preferredColorScheme(.dark)

        }
        .previewLayout(.sizeThatFits)
    }
}
