import SwiftUI

@main
struct RefactorTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: .init(appState: AppState.shared),
                appState: AppState.shared
            )
        }
    }
}
