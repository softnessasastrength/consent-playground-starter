import SwiftUI

struct WelcomeView: View {
    let onBegin: () -> Void

    var body: some View {
        VStack(spacing: 28) {
            Spacer()

            Image(systemName: "heart.text.square.fill")
                .font(.system(size: 76))
                .accessibilityHidden(true)

            VStack(spacing: 12) {
                Text("Consent is a conversation.")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                Text("Explore how consent changes with context, boundaries, uncertainty, and withdrawal.")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            Button(action: onBegin) {
                Text("Begin the experience")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .accessibilityHint("Starts the interactive consent scenario")

            Spacer()

            Text("A private, offline educational prototype.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding(32)
        .navigationTitle("Consent Playground")
    }
}
