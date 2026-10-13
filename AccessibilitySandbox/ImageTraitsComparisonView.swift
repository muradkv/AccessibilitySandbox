//
//  ImageTraitsComparisonView.swift
//  AccessibilitySandbox
//
//  Created by murad on 12.10.2026.
//

import SwiftUI

struct ImageTraitsComparisonView: View {
    private let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    private let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    @State private var useBestPractice = true
    
    var body: some View {
        VStack(spacing: 24) {
            Picker("Implementation Style", selection: $useBestPractice) {
                Text("Best Practice (Button)").tag(true)
                Text("Workaround (Image Tap)").tag(false)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            Spacer()
            
            if useBestPractice {
                Button {
                    randomizePicture()
                } label: {
                    displayImage
                }
                .accessibilityLabel(labels[selectedPicture])
                .accessibilityHint("Shows a random photo")
            } else {
                displayImage
                    .onTapGesture {
                        randomizePicture()
                    }
                    .accessibilityLabel(labels[selectedPicture])
                    .accessibilityAddTraits(.isButton)
                    .accessibilityRemoveTraits(.isImage)
            }
            
            Spacer()
            
            Text(useBestPractice
                 ? "VoiceOver automatically recognizes the element as a button and announces system activation hints."
                 : "Manually added .isButton trait and removed .isImage trait for custom onTapGesture recognition.")
            .font(.footnote)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }
        .padding(.vertical)
        .navigationTitle("Image Traits & Labels")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var displayImage: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 300)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 4)
            .padding(.horizontal)
    }
    
    private func randomizePicture() {
        selectedPicture = Int.random(in: 0...3)
    }
}

#Preview {
    ImageTraitsComparisonView()
}
