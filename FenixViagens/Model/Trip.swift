//
//  Trip.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 17/12/21.
//

import Foundation

struct Trip: Codable {
    var id: Int
    var titulo: String
    var asset: String
    var subtitulo: String
    var diaria: Int
    var hospedes: Int
    var precoSemDesconto: Double
    var preco: Double
    var cancelamento: String
    
    static func jsonToData(_ json:[String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }

    static func decodeJson(_ jsonData: Data) -> Trip? {
        do {
            return try JSONDecoder().decode(Trip.self, from: jsonData)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

//struct TitleSession: Codable {
//    var session: String
//
//    static func jsonData(_ json: String) -> Data? {
//        return try? JSONSerialization.data(withJSONObject: json, options: [])
//    }
//
//    static func decodeJson(_ jsonData: Data) -> TitleSession? {
//        do {
//            return try JSONDecoder().decode(TitleSession.self, from: jsonData)
//        } catch {
//            print(error.localizedDescription)
//            return nil
//        }
//    }
//}
