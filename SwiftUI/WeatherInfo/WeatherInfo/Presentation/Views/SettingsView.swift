import SwiftUI

enum TemperatureUnit: String, CaseIterable {
    case celsius = "°C"
    case fahrenheit = "°F"
}

struct SettingsView: View {
    @AppStorage("darkMode") private var isDarkMode = false
    @AppStorage("notifications") private var notificationsEnabled = true
    @AppStorage("temperatureUnit") private var temperatureUnit = TemperatureUnit.fahrenheit
    @AppStorage("language") private var language = "EN"
    @State private var showingLogoutAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                // Profile Section
                Section {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("placeholder")
                                .font(.headline)
                            Text("placeholder@gmail.com")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
                
                // Location Section
                Section {
                    NavigationLink {
                        Text("Location Settings") // Placeholder view
                    } label: {
                        HStack {
                            Text("Location")
                            Spacer()
                            Text("alex, egypt")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                // Settings Section
                Section {
                    Toggle("Notifications", isOn: $notificationsEnabled)
                    
                    NavigationLink {
                        Text("Language Settings")
                    } label: {
                        HStack {
                            Text("Language")
                            Spacer()
                            Text(language)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Temperature")
                        Picker("Temperature Unit", selection: $temperatureUnit) {
                            ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                                Text(unit.rawValue).tag(unit)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding(.vertical, 4)
                    
                    Toggle("Dark mode", isOn: $isDarkMode)
                        .onChange(of: isDarkMode) { newValue in
                            (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.overrideUserInterfaceStyle = newValue ? .dark : .light
                        }
                }
                
                // Help Section
                Section {
                    NavigationLink {
                        Text("Help Center") // Placeholder view
                    } label: {
                        Text("Help")
                    }
                }
                
                // Logout Section
                Section {
                    Button(role: .destructive) {
                        showingLogoutAlert = true
                    } label: {
                        HStack {
                            Text("Log out")
                            Spacer()
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    }
                }
                
                // Version Info
                Section {
                        Text("Version \(Bundle.main.appVersion)")
                            .foregroundStyle(.secondary)
                            .listRowBackground(Color.clear)
                }
                .listSectionSpacing(.compact)
            }
            .navigationTitle("Settings")
            .alert("Log Out", isPresented: $showingLogoutAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Log Out", role: .destructive) {
                    // Handle logout
                }
            } message: {
                Text("Are you sure you want to log out?")
            }
        }
    }
}

#Preview {
    Group {
        NavigationStack {
            SettingsView()
                .preferredColorScheme(.light)
        }
        
        NavigationStack {
            SettingsView()
                .preferredColorScheme(.dark)
        }
    }
} 
