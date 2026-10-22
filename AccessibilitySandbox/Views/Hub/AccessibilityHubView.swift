//
//  AccessibilityHubView.swift
//  AccessibilitySandbox
//
//  Created by murad on 11.10.2026.
//

import SwiftUI

struct AccessibilityHubView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Core Concepts") {
                    ForEach(AccessibilityTopic.allCases) { topic in
                        NavigationLink(value: topic) {
                            Label {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(topic.title)
                                        .font(.headline)
                                    Text(topic.subtitle)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            } icon: {
                                Image(systemName: topic.systemImage)
                                    .foregroundStyle(.tint)
                            }
                            .padding(.vertical, 2)
                        }
                    }
                }
            }
            .navigationTitle("Accessibility Hub")
            .navigationDestination(for: AccessibilityTopic.self) { topic in
                destinationView(for: topic)
            }
        }
    }
    
    @ViewBuilder
    private func destinationView(for topic: AccessibilityTopic) -> some View {
        switch topic {
        case .imagesAndTraits:
            ImageTraitsComparisonView()
        case .hidingAndGrouping:
            GroupingAndHidingView()
        case .adjustableValues:
            AdjustableControlView()
        case .voiceInputLabels:
            VoiceInputLabelsView()
        }
    }
}

#Preview {
    AccessibilityHubView()
}
