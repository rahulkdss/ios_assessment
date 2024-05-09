// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct UniversitiesModel: Codable, Sendable {
    var stateProvince: String?
    var domains: [String]?
    var webPages: [String]?
    var name: String?
    var alphaTwoCode: String?
    var country: String?

    enum CodingKeys: String, CodingKey {
        case stateProvince = "state-province"
        case domains
        case webPages = "web_pages"
        case name
        case alphaTwoCode = "alpha_two_code"
        case country
    }
}
