@testable import WeatherInfo

final class MockSearchLocationsUseCase: SearchLocationsUseCase {
    private let mockResults: [Location]
    private let shouldFail: Bool
    private(set) var searchCount = 0
    
    init(mockResults: [Location] = [], shouldFail: Bool = false) {
        self.mockResults = mockResults
        self.shouldFail = shouldFail
    }
    
    func execute(query: String, limit: Int) async throws -> [Location] {
        searchCount += 1
        
        if shouldFail {
            struct MockError: Error {}
            throw MockError()
        }
        
        return mockResults
    }
} 