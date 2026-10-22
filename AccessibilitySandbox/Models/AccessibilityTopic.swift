//
//  AccessibilityTopic.swift
//  AccessibilitySandbox
//
//  Created by murad on 21.10.2026.
//

import Foundation

enum AccessibilityTopic: String, CaseIterable, Identifiable {
    case imagesAndTraits
    case hidingAndGrouping
    case adjustableValues
    case voiceInputLabels

    var id: String { rawValue }

    var title: String {
        switch self {
        case .imagesAndTraits:
            return "Images & Traits"
        case .hidingAndGrouping:
            return "Hiding & Grouping"
        case .adjustableValues:
            return "Reading & Adjusting Values"
        case .voiceInputLabels:
            return "Voice Input Labels"
        }
    }

    var subtitle: String {
        switch self {
        case .imagesAndTraits:
            return "Custom labels, hints, and .isButton traits"
        case .hidingAndGrouping:
            return ".accessibilityHidden and children combining"
        case .adjustableValues:
            return "Swipe increments with .accessibilityAdjustableAction"
        case .voiceInputLabels:
            return "Alternative triggers for iOS Voice Control"
        }
    }

    var systemImage: String {
        switch self {
        case .imagesAndTraits:
            return "photo.badge.checkmark"
        case .hidingAndGrouping:
            return "rectangle.compress.vertical"
        case .adjustableValues:
            return "slider.vertical.3"
        case .voiceInputLabels:
            return "mic.badge.plus"
        }
    }
}
