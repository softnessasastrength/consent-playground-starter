import SwiftUI

struct ScenarioView: View {
    @State private var stepIndex = 0
    @State private var selectedChoice: ScenarioChoice?
    @State private var score = 0
    @State private var isComplete = false

    private var step: ScenarioStep {
        DemoScenario.steps[stepIndex]
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ProgressView(
                    value: Double(stepIndex + 1),
                    total: Double(DemoScenario.steps.count)
                )
                .accessibilityLabel("Scenario progress")
                .accessibilityValue("Step \(stepIndex + 1) of \(DemoScenario.steps.count)")

                Text("Step \(stepIndex + 1)")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)

                Text(step.narration)
                    .font(.title2.weight(.semibold))

                Text(step.prompt)
                    .font(.headline)

                ForEach(step.choices) { choice in
                    Button {
                        guard selectedChoice == nil else { return }
                        selectedChoice = choice
                        if choice.isRespectful {
                            score += 1
                        }
                    } label: {
                        HStack {
                            Text(choice.title)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            if selectedChoice?.id == choice.id {
                                Image(systemName: choice.isRespectful ? "checkmark.circle.fill" : "xmark.circle.fill")
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .buttonStyle(.bordered)
                    .disabled(selectedChoice != nil)
                }

                if let selectedChoice {
                    FeedbackCard(choice: selectedChoice)

                    Button {
                        advance()
                    } label: {
                        Text(stepIndex == DemoScenario.steps.count - 1 ? "See what changed" : "Continue")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(24)
        }
        .navigationDestination(isPresented: $isComplete) {
            SummaryView(score: score)
        }
        .navigationTitle("The Consent Engine")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func advance() {
        if stepIndex < DemoScenario.steps.count - 1 {
            stepIndex += 1
            selectedChoice = nil
        } else {
            isComplete = true
        }
    }
}

private struct FeedbackCard: View {
    let choice: ScenarioChoice

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(choice.outcome.title, systemImage: choice.outcome.symbolName)
                .font(.headline)

            Text(choice.feedback)

            Text(choice.outcome.explanation)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18))
        .accessibilityElement(children: .combine)
    }
}
