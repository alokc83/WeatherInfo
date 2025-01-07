import SwiftUI

struct SearchView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""
    @State private var searchResults: [String] = []
    @State private var isSearching = false
    
    // Sample data - replace with real data later
    private let sampleCities = [
        "Cairo, Egypt",
        "Giza, Egypt",
        "Marsa Matruh, Egypt"
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search Bar with Button
                HStack(spacing: 8) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search", text: $searchText)
                            .submitLabel(.search)
                            .onSubmit(performSearch)
                    }
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    
                    Button(action: performSearch) {
                        Text("Search")
                            .fontWeight(.medium)
                    }
                }
                .padding()
                
                // Results List
                List {
                    if isSearching {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else if searchResults.isEmpty && !searchText.isEmpty {
                        Text("No results found")
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        ForEach(searchResults, id: \.self) { city in
                            Button(action: {
                                // Handle city selection
                                dismiss()
                            }) {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.secondary)
                                    Text(city)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Image(systemName: "mappin.circle.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func performSearch() {
        guard !searchText.isEmpty else {
            searchResults = []
            return
        }
        
        // Simulate network request
        isSearching = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            searchResults = sampleCities.filter { $0.localizedCaseInsensitiveContains(searchText) }
            isSearching = false
        }
    }
}

#Preview {
    SearchView()
} 