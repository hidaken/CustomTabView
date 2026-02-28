# CustomTabView

A lightweight, generic wrapper around SwiftUI's `TabView` that lets you define your tabs as a type-safe `enum` conforming to `CustomTabItem`. This provides a clean way to declare labels, system images, and optional `TabRole` (e.g., search) per tab, while keeping selection strongly typed.

## Features
- Strongly typed tab items using an `enum` that conforms to `CustomTabItem`
- Simple API for providing per-tab content with a closure
- Full control over tab label, SF Symbol, and optional `TabRole`
- Works with SwiftUI's `TabView(selection:)`

## Requirements

- iOS 18.0+
- Swift 6.2+
- SwiftUI

## Usage (Reference: CustomTabSampleView.swift)

The file CustomTabSampleView.swift in the project demonstrates a minimal setup using CustomTabView with a strongly typed enum that conforms to CustomTabItem. Start by defining your enum and then provide content via the CustomTabView closure.

- Simple usage: CustomTabView(selectedTab:){ tab in ... }
- Strong typing: enum conforms to CustomTabItem to supply label, SF Symbol, and optional TabRole
- Selection binding: drive the current tab with a @State binding

// 1) Define your tab items
private enum CustomTabSampleItem: String, CustomTabItem {
    case first
    case second
    case third
    case search

    var id: String { rawValue }

    var labelTitle: String { rawValue.capitalized }

    var imageSystemName: String {
        switch self {
        case .first:  "die.face.1"
        case .second: "die.face.2"
        case .third:  "die.face.3"
        case .search: "magnifyingglass"
        }
    }

    var tabRole: TabRole? {
        switch self {
        case .search: .search
        default: nil
        }
    }
}

// 2) Bind selection and render CustomTabView
struct ExampleView: View {
    @State private var selectedTab: CustomTabSampleItem = .first

    var body: some View {
        CustomTabView(selectedTab: $selectedTab) { tab in
            HStack(spacing: 8) {
                Image(systemName: tab.imageSystemName)
                Text(tab.labelTitle)
            }
            .font(.largeTitle)
        }
    }
}

For comparison with system primitives, CustomTabView is a thin, type-safe wrapper over SwiftUI's TabView(selection:). If you prefer, you can reproduce similar behavior with TabView directly, but CustomTabView helps centralize label/icon/role definitions and keeps your selection strongly typed. 
