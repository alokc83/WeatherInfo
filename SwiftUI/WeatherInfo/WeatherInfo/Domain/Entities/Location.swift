struct Location: Equatable, Hashable {
    let name: String
    let latitude: Double
    let longitude: Double
    let country: String
    let state: String?
    
    // Custom hash function to ensure unique identification
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(latitude)
        hasher.combine(longitude)
        hasher.combine(country)
        hasher.combine(state)
    }
} 