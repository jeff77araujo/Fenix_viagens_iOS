//
//  InternationalTripViewModel.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 27/12/21.
//

import Foundation

class InternationalTripViewModel: TripViewModel {
    var titleSession: String { return "Internacional" }
    var type: TripViewModelType { return .international }
    var trips: [Trip]
    var numberLines: Int { return trips.count }
    
    init(_ trips: [Trip]) {
        self.trips = trips
    }
}
