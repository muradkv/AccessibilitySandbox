# Accessibility Sandbox

![Swift](https://img.shields.io/badge/Swift-5.0+-FA7343?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-18.0+-000000?logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-16.0+-147EFB?logo=xcode&logoColor=white)
![Framework](https://img.shields.io/badge/Framework-SwiftUI-007AFF)
![Architecture](https://img.shields.io/badge/Architecture-Modular_Router-8A2BE2)

An interactive iOS technical showcase and laboratory built natively with SwiftUI, developed as **Project 15** of the 100 Days of SwiftUI course.

Accessibility Sandbox demonstrates core iOS Assistive Technology integrations—specifically **VoiceOver** and **Voice Control**—through side-by-side comparisons of naive ("problematic") UI implementations versus accessible, HIG-compliant patterns.

## Features

- **Side-by-Side Accessibility Audits:** Every demo screen contrasts default SwiftUI behavior against optimized accessibility configurations so developers can test and hear the difference directly in VoiceOver.
- **Semantic Labels & Traits (`ImageTraitsComparisonView`):** Demonstrates replacing raw asset filename announcements with descriptive `.accessibilityLabel`, `.accessibilityHint`, and `.accessibilityAddTraits(.isButton)` modifiers while preventing trait duplication on native `Button` views.
- **Tree Hygiene & Element Grouping (`GroupingAndHidingView`):** Showcases removing decorative graphics from the accessibility tree via `.accessibilityHidden(true)` and merging related text stacks using `.accessibilityElement(children: .combine)` and `.ignore`.
- **Custom Adjustable Controls (`AdjustableControlView`):** Transforms custom multi-button stepper interfaces into a single unified swipe-adjustable control powered by `.accessibilityValue` and `.accessibilityAdjustableAction`.
- **Voice Control Input Synonyms (`VoiceInputLabelsView`):** Configures `.accessibilityInputLabels` arrays so users navigating hands-free via iOS Voice Control can trigger buttons using multiple natural spoken aliases.

## About the Project & Challenge

This application was built during **Project 15 (Days 74–76)** of the SwiftUI learning path created by Paul Hudson (Hacking with Swift).

In addition to building this interactive sandbox, the concepts practiced here were applied across six full applications in the portfolio during the Day 75 and Day 76 challenges:
- **Guess the Flag (Day 75):** Added non-spoiler visual flag descriptions and combined question prompt headers.
- **Word Scramble (Day 75):** Extracted `UsedWordRowView` and grouped SF Symbol letter counters with word strings into a single VoiceOver announcement.
- **Bookworm (Day 75):** Refactored the reusable `RatingView` star picker into a unified `.accessibilityAdjustableAction` control with smart label fallbacks.
- **Cupcake Corner (Day 76):** Suppressed decorative remote `AsyncImage` containers and loading spinners from screen readers.
- **iExpense (Day 76):** Grouped `ExpenseRowView` cells to announce expense names and locale-formatted currency values in one label with category hints.
- **Moonshot (Day 76):** Executed a full multi-screen accessibility audit covering mission cards, crew rosters, `.isHeader` section traits, and natural `"Never launched"` date readouts.

Key architectural practices implemented in this repository include:
- **Type-Safe Enum Routing:** Encapsulated all showcase modules inside an `AccessibilityTopic` enum (`CaseIterable`, `Identifiable`) storing titles, subtitles, and SF Symbol icons.
- **Lazy Data-Driven Navigation:** Replaced eager destination closures with `NavigationLink(value:)` and a centralized `.navigationDestination(for: AccessibilityTopic.self)` factory, instantiating demo views strictly on user selection.
- **Modular Directory Structure:** Organized the codebase into clean domain layers (`App`, `Models`, `Views/Hub`, `Views/Demos`, `Resources`).

🔗 **[Full project description (Day 74)](https://www.hackingwithswift.com/100/swiftui/74)**  
🔗 **[Day 75 Challenges](https://www.hackingwithswift.com/100/swiftui/75)**  
🔗 **[Day 76 Challenges](https://www.hackingwithswift.com/100/swiftui/76)**

## Project Versioning & Changelog

- **v1.1.0 (Type-Safe Router & Modular Structure)** — `commit: a2d2868`  
  Reorganized the codebase into a layered directory hierarchy (`App`, `Models`, `Views/Hub`, `Views/Demos`, `Resources`). Introduced the `AccessibilityTopic` enum model and migrated `AccessibilityHubView` to lazy data-driven `.navigationDestination` routing.

- **v1.0.0 (Core Accessibility Sandbox Demos)** — `commit: e4a9dde`  
  Initial release covering all Day 74 accessibility demonstrations: `ImageTraitsComparisonView`, `GroupingAndHidingView`, `AdjustableControlView`, and `VoiceInputLabelsView`.
