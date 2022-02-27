// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let menuServerModel = try? newJSONDecoder().decode(MenuServerModel.self, from: jsonData)

import Foundation

// MARK: - MenuServerModel
struct MenuServerModel: Codable {
    let menuResponse: [MenuResponse]?

    enum CodingKeys: String, CodingKey {
        case menuResponse = "menuResponse"
    }
}

// MARK: - MenuResponse
struct MenuResponse: Codable {
    let menu: Menu?

    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

// MARK: - Menu
struct Menu: Codable {
    let imagen: String?
    let literal: String?

    enum CodingKeys: String, CodingKey {
        case imagen = "imagen"
        case literal = "literal"
    }
}
