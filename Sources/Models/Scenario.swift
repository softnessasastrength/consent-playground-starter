import Foundation

struct ScenarioStep: Identifiable {
    let id = UUID()
    let narration: String
    let prompt: String
    let choices: [ScenarioChoice]
}

struct ScenarioChoice: Identifiable {
    let id = UUID()
    let title: String
    let outcome: ConsentState
    let feedback: String
    let isRespectful: Bool
}

enum DemoScenario {
    static let steps: [ScenarioStep] = [
        ScenarioStep(
            narration: "Alex and Sam have talked openly. Sam says, ‘Yes, but I want to go slowly.’",
            prompt: "What is the current consent state?",
            choices: [
                ScenarioChoice(
                    title: "Freely given, with a boundary",
                    outcome: .conditional,
                    feedback: "Exactly. A yes can include conditions. Respecting the boundary is part of respecting the yes.",
                    isRespectful: true
                ),
                ScenarioChoice(
                    title: "Unlimited consent",
                    outcome: .uncertain,
                    feedback: "A yes to one thing is not permission for everything. Consent is specific.",
                    isRespectful: false
                )
            ]
        ),
        ScenarioStep(
            narration: "A moment later, Sam becomes quiet, pulls away, and says, ‘I’m not sure anymore.’",
            prompt: "What should Alex do next?",
            choices: [
                ScenarioChoice(
                    title: "Pause and check in",
                    outcome: .uncertain,
                    feedback: "Correct. Uncertainty is a reason to pause—not a puzzle to push through.",
                    isRespectful: true
                ),
                ScenarioChoice(
                    title: "Continue because Sam agreed earlier",
                    outcome: .withdrawn,
                    feedback: "Earlier consent does not override present uncertainty. Consent must remain current.",
                    isRespectful: false
                )
            ]
        ),
        ScenarioStep(
            narration: "Sam says clearly, ‘I want to stop.’",
            prompt: "What is required now?",
            choices: [
                ScenarioChoice(
                    title: "Stop immediately",
                    outcome: .withdrawn,
                    feedback: "Yes. Consent is reversible at any time, for any reason.",
                    isRespectful: true
                ),
                ScenarioChoice(
                    title: "Ask Sam to explain first",
                    outcome: .withdrawn,
                    feedback: "Stopping does not require an explanation. A boundary is valid without negotiation.",
                    isRespectful: false
                )
            ]
        )
    ]
}
