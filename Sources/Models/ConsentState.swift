import Foundation

enum ConsentState: String, CaseIterable, Codable {
    case notDiscussed
    case freelyGiven
    case conditional
    case uncertain
    case withdrawn

    var title: String {
        switch self {
        case .notDiscussed: "Not discussed"
        case .freelyGiven: "Freely given"
        case .conditional: "Conditional"
        case .uncertain: "Uncertain"
        case .withdrawn: "Withdrawn"
        }
    }

    var explanation: String {
        switch self {
        case .notDiscussed:
            "No clear conversation has happened yet."
        case .freelyGiven:
            "A clear, voluntary yes is present right now."
        case .conditional:
            "Consent exists only within a stated boundary."
        case .uncertain:
            "Hesitation means pause and check in."
        case .withdrawn:
            "Consent has ended. Stop immediately."
        }
    }

    var symbolName: String {
        switch self {
        case .notDiscussed: "questionmark.circle"
        case .freelyGiven: "checkmark.circle.fill"
        case .conditional: "slider.horizontal.3"
        case .uncertain: "pause.circle.fill"
        case .withdrawn: "stop.circle.fill"
        }
    }
}
