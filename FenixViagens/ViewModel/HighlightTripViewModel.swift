//
//  HighlightTripViewModel.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 18/12/21.
//

import Foundation


class HighlightTripViewModel: TripViewModel {
    
    var titleSession: String { return "Destaques" }
    var type: TripViewModelType { return .highlights }
    var trips: [Trip]
    var numberLines: Int { return trips.count }
    
    init(_ trips: [Trip]) {
        self.trips = trips
    }
}
