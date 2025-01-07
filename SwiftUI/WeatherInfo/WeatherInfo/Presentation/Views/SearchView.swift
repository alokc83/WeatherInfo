import SwiftUI
import Combine

struct SearchView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: SearchViewModel
    
    init(useCase: SearchLocationsUseCase = DefaultSearchLocationsUseCase(
        repository: DefaultWeatherRepository(
            apiService: WeatherAPIService()
        )
    )) {
        _viewModel = StateObject(wrappedValue: SearchViewModel(useCase: useCase))
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search Bar with Button
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Search", text: $viewModel.searchText)
                        .submitLabel(.search)
                }
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
                
                // Results List
                List {
                    if viewModel.isSearching {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else if viewModel.searchResults.isEmpty && !viewModel.searchText.isEmpty {
                        Text("No results found")
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        ForEach(viewModel.searchResults, id: \.self) { city in
                            Button(action: {
                                // Handle city selection
                                dismiss()
                            }) {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.secondary)
                                    Text(city.name)
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
        Task {
            await viewModel.performSearch()
        }
    }
}

final class SearchViewModel: ObservableObject {
    @Published private(set) var searchResults: [Location] = []
    @Published private(set) var isSearching = false
    @Published var searchText = ""
    
    private let useCase: SearchLocationsUseCase
    private var searchTask: Task<Void, Never>?
    
    init(useCase: SearchLocationsUseCase) {
        self.useCase = useCase
        
        // Set up debounced search
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                self?.performDebouncedSearch(text: text)
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    private func performDebouncedSearch(text: String) {
        // Cancel any existing search task
        searchTask?.cancel()
        
        // Create new search task
        searchTask = Task { @MainActor in
            await performSearch()
        }
    }
    
    @MainActor
    func performSearch() async {
        guard !searchText.isEmpty else {
            searchResults = []
            return
        }
        
        isSearching = true
        searchResults = []
        
        do {
            // Check if task was cancelled
            try Task.checkCancellation()
            searchResults = try await useCase.execute(query: searchText, limit: 5)
        } catch is CancellationError {
            // Search was cancelled, do nothing
            return
        } catch {
            // Handle other errors
            searchResults = []
        }
        isSearching = false
    }
}

#Preview {
    SearchView()
} 