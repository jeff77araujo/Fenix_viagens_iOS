//
//  OffersViewModel.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 22/12/21.
//

import Foundation

class OffersViewModel: TripViewModel {
    
    var titleSession: String { return "Ofertas" }
    var type: TripViewModelType { return .offers }
    var trips: [Trip]
    var numberLines: Int { return trips.count }
    
    init(_ trips: [Trip]) {
        self.trips = trips
    }
}
