import SwiftUI

struct CitiesView: View {
    @State private var showingSearch = false
    
    var body: some View {
        NavigationStack {
            List {
                Text("No cities added yet")
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Cities")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showingSearch = true }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Label("Add City", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingSearch) {
            SearchView()
        }
    }
}

#Preview {
    CitiesView()
} 