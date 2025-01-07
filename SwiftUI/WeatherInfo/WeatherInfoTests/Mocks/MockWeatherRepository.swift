@testable import WeatherInfo

final class MockWeatherRepository: WeatherRepository {
    private let mockLocations: [Location]
    private let shouldFail: Bool
    
    init(mockLocations: [Location] = [], shouldFail: Bool = false) {
        self.mockLocations = mockLocations
        self.shouldFail = shouldFail
    }
    
    func searchLocations(query: String, limit: Int) async throws -> [Location] {
        if shouldFail {
            struct MockError: Error {}
            throw MockError()
        }
        return mockLocations
    }
} 