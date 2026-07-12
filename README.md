# Consent Playground

A small, offline Swift Playground experience exploring consent as contextual, ongoing, specific, voluntary, and reversible.

## Purpose

This repository is intentionally separate from the main Softness as Strength application. The full app is the product; this Playground is a focused educational thesis suitable for rapid testing and possible adaptation for the Swift Student Challenge.

## Current prototype

- A short three-step scenario
- A consent state model
- Immediate educational feedback
- A final summary of core principles
- VoiceOver-oriented accessibility labels
- No network access or user-data collection

## Consent state model

```swift
enum ConsentState {
    case notDiscussed
    case freelyGiven
    case conditional
    case uncertain
    case withdrawn
}
```

The model deliberately avoids treating consent as a permanent Boolean value.

## Open the project

1. Clone or download this repository.
2. Open `Package.swift` in Swift Playgrounds on Mac or iPad.
3. Allow Swift Playgrounds to resolve the package.
4. Run the app.

A compatible version of Xcode may also open the package.

## Project boundaries

This is an educational prototype, not legal advice, clinical guidance, or a substitute for direct communication.

## AI-assistance disclosure

This initial scaffold was created through human-directed AI assistance. Branden Algozino defined the concept, intended message, product direction, and review criteria. AI assisted with starter SwiftUI implementation and repository documentation. This disclosure should be expanded as the project evolves and updated to match the rules applicable at submission time.

## Next milestones

- Verify the package against the current Swift Playgrounds toolchain
- Refine the visual language
- Replace placeholder scenario language with reviewed educational content
- Add reduced-motion behavior and Dynamic Type testing
- Add a visual state-transition map
- Conduct usability testing
- Confirm the next Swift Student Challenge technical requirements
