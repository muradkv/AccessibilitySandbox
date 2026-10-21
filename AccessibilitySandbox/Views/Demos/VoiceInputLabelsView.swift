//
//  VoiceInputLabelsView.swift
//  AccessibilitySandbox
//
//  Created by murad on 16.10.2026.
//

import SwiftUI

struct VoiceInputLabelsView: View {
    @State private var lastTriggeredMessage = "Tap or use Voice Control to trigger a button"
    @State private var tapCount = 0
    
    var body: some View {
        List {
            Section("Status") {
                VStack(alignment: .leading, spacing: 6) {
                    Text(lastTriggeredMessage)
                        .font(.headline)
                    Text("Total activations: \(tapCount)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
            
            Section {
                Button("John Fitzgerald Kennedy") {
                    registerActivation(for: "John Fitzgerald Kennedy")
                }
                .accessibilityInputLabels([
                    "John Fitzgerald Kennedy",
                    "Kennedy",
                    "JFK"
                ])
                
                Button("Franklin Delano Roosevelt") {
                    registerActivation(for: "Franklin Delano Roosevelt")
                }
                .accessibilityInputLabels([
                    "Franklin Delano Roosevelt",
                    "Roosevelt",
                    "FDR"
                ])
            } header: {
                Text("Voice input buttons")
            } footer: {
                Text("With Voice Control enabled, you can say 'Tap JFK' or 'Tap Kennedy' instead of speaking the full name.")
            }
        }
        .navigationTitle("Voice input labels")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func registerActivation(for name: String) {
        tapCount += 1
        lastTriggeredMessage = "Activated \(name)"
    }
}

#Preview {
    NavigationStack {
        VoiceInputLabelsView()
    }
}
