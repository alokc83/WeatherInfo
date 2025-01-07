import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CitiesView()
                .tabItem {
                    Label("Cities", systemImage: "building.2")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainTabView()
}