import SwiftUI

struct SummaryView: View {
    let score: Int

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                Image(systemName: "arrow.triangle.branch")
                    .font(.system(size: 64))
                    .accessibilityHidden(true)

                Text("Consent changed as the situation changed.")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                Text("You chose \(score) of \(DemoScenario.steps.count) respectful responses.")
                    .font(.title3)

                VStack(alignment: .leading, spacing: 16) {
                    PrincipleRow(title: "Specific", detail: "A yes applies only to what was actually discussed.")
                    PrincipleRow(title: "Ongoing", detail: "Consent must remain present throughout an interaction.")
                    PrincipleRow(title: "Reversible", detail: "Anyone may stop at any time without defending the decision.")
                    PrincipleRow(title: "Voluntary", detail: "Pressure, fear, or manipulation undermine meaningful consent.")
                }

                Text("The safest response to uncertainty is softness: pause, listen, and make room for an honest answer.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding(24)
        }
        .navigationTitle("What the model learned")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct PrincipleRow: View {
    let title: String
    let detail: String

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: "checkmark.seal.fill")
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(detail)
                    .foregroundStyle(.secondary)
            }
        }
        .accessibilityElement(children: .combine)
    }
}
