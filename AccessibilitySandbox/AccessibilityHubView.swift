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
                    NavigationLink {
                        ImageTraitsComparisonView()
                    } label: {
                        Label("Images & Traits", systemImage: "photo.badge.checkmark")
                    }
                    
                    NavigationLink {
                        GroupingAndHidingView()
                    } label: {
                        Label("Hiding & Grouping", systemImage: "rectangle.compress.vertical")
                    }
                    
                    NavigationLink {
                        AdjustableControlView()
                    } label: {
                        Label("Reading & Adjusting Values", systemImage: "slider.vertical.3")
                    }
                    
                    NavigationLink {
                        VoiceInputLabelsView()
                    } label: {
                        Label("Voice Input Labels", systemImage: "mic.badge.plus")
                    }
                }
            }
            .navigationTitle("Accessibility Hub")
        }
    }
}

#Preview {
    AccessibilityHubView()
}
