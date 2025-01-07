import Testing
import XCTest
@testable import WeatherInfo

struct SearchLocationsUseCaseTests {
    @Test func testExecuteSuccess() async throws {
        // Given
        let expectedLocations = [
            Location(name: "Paris", latitude: 48.8566, longitude: 2.3522, country: "FR", state: nil)
        ]
        let repository = MockWeatherRepository(mockLocations: expectedLocations)
        let useCase = DefaultSearchLocationsUseCase(repository: repository)
        
        // When
        let results = try await useCase.execute(query: "Paris", limit: 1)
        
        // Then
        #expect(results == expectedLocations)
    }
    
    @Test func testExecuteFailure() async {
        // Given
        let repository = MockWeatherRepository(shouldFail: true)
        let useCase = DefaultSearchLocationsUseCase(repository: repository)
        
        // When/Then
        do {
            _ = try await useCase.execute(query: "Invalid", limit: 1)
            XCTFail("Expected error to be thrown")
        } catch {
            // Success - error was thrown as expected
        }
    }
} 