//
//  TipoDeViagens.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 07/02/21.
//

import Foundation

struct TypesOfTrips: Codable {
    
    enum CodingKeys: String, CodingKey {
        case highlights = "destaques", offers = "ofertas", international = "internacionais"
    }
    
    var highlights: [Trip]?
    var offers: [Trip]?
    var international: [Trip]?
    
    static func jsonToData(_ json:[String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }

    static func decodeJson(_ jsonData: Data) -> TypesOfTrips? {
        do {
            return try JSONDecoder().decode(TypesOfTrips.self, from: jsonData)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
