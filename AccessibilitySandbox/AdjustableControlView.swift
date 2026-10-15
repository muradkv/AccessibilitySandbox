//
//  AdjustableControlView.swift
//  AccessibilitySandbox
//
//  Created by murad on 15.10.2026.
//

import SwiftUI

struct AdjustableControlView: View {
    @State private var value = 10
    @State private var useAdjustableAction = true
    
    var body: some View {
        VStack(spacing: 24) {
            Picker("", selection: $useAdjustableAction) {
                Text("Adjustable (Swipe)").tag(true)
                Text("Separate Buttons").tag(false)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            Spacer()
            
            if useAdjustableAction {
                stepperCard
                    .accessibilityElement()
                    .accessibilityLabel("Value")
                    .accessibilityValue(String(value))
                    .accessibilityAdjustableAction { direction in
                        switch direction {
                        case .increment:
                            value += 1
                        case .decrement:
                            value -= 1
                        default:
                            print("Not handled.")
                        }
                    }
            } else {
                stepperCard
            }
            
            Spacer()
            
            Text(useAdjustableAction
                 ? "Grouped into a single adjustable element. VoiceOver users swipe up or down to change and hear the new value immediately."
                 : "Default behavior: VoiceOver treats the text and buttons as 3 separate elements and doesn't announce the updated number on tap.")
            .font(.footnote)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }
        .padding(.vertical)
        .navigationTitle("Reading & Adjusting Values")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var stepperCard: some View {
        VStack(spacing: 16) {
            Text("Value: \(value)")
                .font(.system(.largeTitle, design: .rounded).bold())
            
            HStack(spacing: 16) {
                Button("Decrement") {
                    value -= 1
                }
                .buttonStyle(.bordered)
                
                Button("Increment") {
                    value += 1
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(24)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

#Preview {
    AdjustableControlView()
}
