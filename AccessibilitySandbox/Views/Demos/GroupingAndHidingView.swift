//
//  GroupingAndHidingView.swift
//  AccessibilitySandbox
//
//  Created by murad on 13.10.2026.
//

import SwiftUI

struct GroupingAndHidingView: View {
    enum GroupingStrategy: String, CaseIterable, Identifiable {
        case separate = "Separate"
        case combine = "Combine"
        case ignore = "Ignore & Label"
        
        var id: String { rawValue }
        
        var description: String {
            switch self {
            case .separate:
                "Default behavior: VoiceOver selects 'Your score is' and '1000' as two unrelated elements requiring two swipes."
            case .combine:
                "Uses .accessibilityElement(children: .combine). Reads both texts in a single focus with a short pause between them."
            case .ignore:
                "Uses .accessibilityElement(children: .ignore) with a custom label. Reads 'Your score is 1000' naturally all at once."
            }
        }
    }
    
    @State private var selectedStrategy: GroupingStrategy = .ignore
    @State private var isDecorativeHidden = true
    @State private var score = 1000
    
    var body: some View {
        List {
            Section {
                Toggle("Hide Decorative Icon", isOn: $isDecorativeHidden)
                
                HStack(spacing: 16) {
                    Image(systemName: "sparkles")
                        .font(.largeTitle)
                        .foregroundStyle(.yellow)
                        .frame(width: 60, height: 60)
                        .background(.yellow.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .accessibilityHidden(isDecorativeHidden)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(" Decorative Graphics")
                            .font(.headline)
                        Text(isDecorativeHidden
                             ? "Icon is invisible to VoiceOver (.accessibilityHidden(true))."
                             : "VoiceOver will stop on the sparkles icon and read its system name.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 4)
            } header: {
                Text("1. Hiding Unimportant Views")
            }
            
            Section {
                Picker("Grouping Mode", selection: $selectedStrategy) {
                    ForEach(GroupingStrategy.allCases) { strategy in
                        Text(strategy.rawValue).tag(strategy)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 4)
                
                Group {
                    switch selectedStrategy {
                    case .separate:
                        scoreCardBase
                    case .combine:
                        scoreCardBase
                            .accessibilityElement(children: .combine)
                    case .ignore:
                        scoreCardBase
                            .accessibilityElement(children: .ignore)
                            .accessibilityLabel("Your score is \(score)")
                    }
                }
            } header: {
                Text("2. Grouping Child Views")
            } footer: {
                Text(selectedStrategy.description)
            }
        }
        .navigationTitle("Hiding & Grouping")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var scoreCardBase: some View {
        VStack(spacing: 8) {
            Text("Your score is")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text("\(score)")
                .font(.system(.largeTitle, design: .rounded).bold())
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        GroupingAndHidingView()
    }
}
