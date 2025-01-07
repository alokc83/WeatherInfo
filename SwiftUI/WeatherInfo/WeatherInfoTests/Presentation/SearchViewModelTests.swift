import Testing
import Combine
@testable import WeatherInfo

struct SearchViewModelTests {
    @Test func testInitialState() {
        // Given
        let useCase = MockSearchLocationsUseCase()
        let viewModel = SearchViewModel(useCase: useCase)
        
        // Then
        #expect(viewModel.searchResults.isEmpty)
        #expect(!viewModel.isSearching)
        #expect(viewModel.searchText.isEmpty)
    }
    
    @Test func testEmptySearchTextClearsResults() async {
        // Given
        let useCase = MockSearchLocationsUseCase()
        let viewModel = SearchViewModel(useCase: useCase)
        
        // When
        viewModel.searchText = ""
        await viewModel.performSearch()
        
        // Then
        #expect(viewModel.searchResults.isEmpty)
        #expect(!viewModel.isSearching)
    }
    
    @Test func testSuccessfulSearch() async {
        // Given
        let expectedLocations = [
            Location(name: "London", latitude: 51.5074, longitude: -0.1278, country: "GB", state: nil),
            Location(name: "London", latitude: 42.9834, longitude: -81.233, country: "CA", state: "Ontario")
        ]
        let useCase = MockSearchLocationsUseCase(mockResults: expectedLocations)
        let viewModel = SearchViewModel(useCase: useCase)
        
        // When
        viewModel.searchText = "London"
        await viewModel.performSearch()
        
        // Then
        #expect(viewModel.searchResults == expectedLocations)
        #expect(!viewModel.isSearching)
    }
    
    @Test func testFailedSearch() async {
        // Given
        let useCase = MockSearchLocationsUseCase(shouldFail: true)
        let viewModel = SearchViewModel(useCase: useCase)
        
        // When
        viewModel.searchText = "Invalid"
        await viewModel.performSearch()
        
        // Then
        #expect(viewModel.searchResults.isEmpty)
        #expect(!viewModel.isSearching)
    }
    
    @Test func testSearchDebounce() async {
        // Given
        let useCase = MockSearchLocationsUseCase()
        let viewModel = SearchViewModel(useCase: useCase)
        
        // When
        viewModel.searchText = "L"
        viewModel.searchText = "Lo"
        viewModel.searchText = "Lon"
        viewModel.searchText = "Lond"
        viewModel.searchText = "Londo"
        viewModel.searchText = "London"
        
        // Then
        // Wait for debounce
        try? await Task.sleep(nanoseconds: 400_000_000) // 400ms
        #expect(useCase.searchCount == 1) // Should only search once due to debounce
    }
    
    @Test func testConcurrentSearches() async {
        // Given
        let useCase = MockSearchLocationsUseCase()
        let viewModel = SearchViewModel(useCase: useCase)
        
        // When
        async let search1 = viewModel.performSearch() // First search
        viewModel.searchText = "New" // Change text while first search is running
        async let search2 = viewModel.performSearch() // Second search
        
        // Then
        await _ = [search1, search2]
        #expect(useCase.searchCount == 2)
    }
    
    @Test func testMinimumSearchLength() async {
        // Given
        let useCase = MockSearchLocationsUseCase()
        let viewModel = SearchViewModel(useCase: useCase)
        
        // When
        viewModel.searchText = "a" // Too short
        await viewModel.performSearch()
        
        // Then
        #expect(viewModel.searchResults.isEmpty)
        #expect(useCase.searchCount == 0)
    }
    
    @Test func testSearchStateTransitions() async {
        // Given
        let useCase = MockSearchLocationsUseCase(mockResults: [
            Location(name: "Test", latitude: 0, longitude: 0, country: "XX", state: nil)
        ])
        let viewModel = SearchViewModel(useCase: useCase)
        
        // When/Then
        #expect(!viewModel.isSearching) // Initial state
        
        viewModel.searchText = "Test"
        let searchTask = Task {
            await viewModel.performSearch()
        }
        
        // Small delay to allow state to update
        try? await Task.sleep(nanoseconds: 100_000_000)
        #expect(viewModel.isSearching) // During search
        
        await searchTask.value
        #expect(!viewModel.isSearching) // After search
        #expect(!viewModel.searchResults.isEmpty)
    }
    
    @Test func testSearchCancellation() async {
        // Given
        let useCase = MockSearchLocationsUseCase()
        let viewModel = SearchViewModel(useCase: useCase)
        
        // When
        viewModel.searchText = "First"
        let firstSearch = Task {
            await viewModel.performSearch()
        }
        
        // Immediately start second search
        viewModel.searchText = "Second"
        let secondSearch = Task {
            await viewModel.performSearch()
        }
        
        // Then
        await _ = [firstSearch.value, secondSearch.value]
        #expect(useCase.searchCount == 2) // Both searches should have run
    }
} 