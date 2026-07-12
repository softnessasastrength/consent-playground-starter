import SwiftUI

struct ExperienceView: View {
    @State private var hasStarted = false

    var body: some View {
        NavigationStack {
            Group {
                if hasStarted {
                    ScenarioView()
                } else {
                    WelcomeView {
                        withAnimation(.easeInOut) {
                            hasStarted = true
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Restart") {
                        withAnimation(.easeInOut) {
                            hasStarted = false
                        }
                    }
                    .opacity(hasStarted ? 1 : 0)
                }
            }
        }
    }
}
