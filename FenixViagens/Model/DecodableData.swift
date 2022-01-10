//
//  DecodableData.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 17/12/21.
//

import Foundation

let sessionOfTrips: [TripViewModel]? = load("server-response.json")

func load(_ filename: String) -> [TripViewModel]? {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            fatalError("error to read json dictionary")
        }
        
        guard let listOfTrips = json["viagens"] as? [String: Any] else {
            fatalError("error to read travel list")
        }
        
        guard let jsonData = TypesOfTrips.jsonToData(listOfTrips) else { return nil }
        let typesOfTrips = TypesOfTrips.decodeJson(jsonData)
        
        var listTripViewModel: [TripViewModel] = []
        
        for session in listOfTrips.keys {
            let type = TripViewModelType(rawValue: session)
            switch type {
            case .highlights:
                if let highlights = typesOfTrips?.highlights {
                    let highlightTripViewModel = HighlightTripViewModel(highlights)
                    listTripViewModel.append(highlightTripViewModel)
                }
            case .offers:
                if let offers = typesOfTrips?.offers {
                    let offerTripViewModel = OffersViewModel(offers)
                    listTripViewModel.append(offerTripViewModel)
                }
            case .international:
                if let international = typesOfTrips?.international {
                    let internationalTripViewModel = InternationalTripViewModel(international)
                    listTripViewModel.append(internationalTripViewModel)
                }
            default:
                break
            }
        }
        return listTripViewModel
        
    } catch {
        fatalError("Couldn't parse")
    }
}
