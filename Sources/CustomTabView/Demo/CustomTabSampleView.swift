//
//  CustomTabSampleView.swift
//  ShadowingMaster
//
//  Created by hidaken on 2026/02/28.
//

import SwiftUI

private enum CustomTabSampleItem: String, CustomTabItem {
    
    case first
    case second
    case third
    case search
    
    var id: String {
        return self.rawValue
    }
    
    var labelTitle: String {
        return self.rawValue.capitalized
    }
    
    var imageSystemName: String {
        switch self {
        case .first:
            "die.face.1"
        case .second:
            "die.face.2"
        case .third:
            "die.face.3"
        case .search:
            "magnifyingglass"
        }
    }
    
    var tabRole: TabRole? {
        switch self {
        case .search:
            .search
        default:
            nil
        }
    }
}

private struct CustomTabSampleView: View {
    
    @State var selectedTab: CustomTabSampleItem = .first
    
    var body: some View {
        CustomTabView(selectedTab: $selectedTab) { tab in
            switch tab {
            case .first:
                HStack(spacing: 8) {
                    Image(systemName: tab.imageSystemName)
                    Text("\(tab.labelTitle)")
                }
                .foregroundStyle(.red)
                .font(.largeTitle)
            case .second:
                VStack(spacing: 8) {
                    Image(systemName: tab.imageSystemName)
                    Text("\(tab.labelTitle)")
                }
                .foregroundStyle(.blue)
                .font(.largeTitle)
            case .third:
                HStack(spacing: 8) {
                    Image(systemName: tab.imageSystemName)
                    Text("\(tab.labelTitle)")
                }
                .foregroundStyle(.yellow)
                .font(.largeTitle)
            case .search:
                HStack(spacing: 8) {
                    Image(systemName: tab.imageSystemName)
                    Text("\(tab.labelTitle)")
                }
                .foregroundStyle(.green)
                .font(.largeTitle)
            }
        }
    }
}

#Preview {
    CustomTabSampleView()
}
