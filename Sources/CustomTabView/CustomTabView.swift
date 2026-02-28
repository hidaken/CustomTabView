import SwiftUI

public protocol CustomTabItem: Identifiable, Hashable, CaseIterable {
    var labelTitle: String { get }
    var imageSystemName: String { get }
    var tabRole: TabRole? { get }
}

public struct CustomTabView<TabItem: CustomTabItem, Content: View>: View {
    
    @Binding var selectedTab: TabItem
    
    @ViewBuilder let content: (TabItem) -> Content
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Array(TabItem.allCases)) { tab in
                Tab(tab.labelTitle, systemImage: tab.imageSystemName, value: tab, role: tab.tabRole) {
                    content(tab)
                }
            }
        }
    }
}
