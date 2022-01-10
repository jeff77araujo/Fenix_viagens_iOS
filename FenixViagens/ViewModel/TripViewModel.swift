//
//  ViagemViewModel.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 18/12/21.
//

import Foundation

enum TripViewModelType: String {
    case highlights
    case offers
    case international
    case unknown
    
    init?(rawValue: String) {
        switch rawValue {
            case  "destaques": self = .highlights
            case  "ofertas": self = .offers
            case  "internacionais": self = .international
            default: self = .unknown
        }
    }
}

protocol TripViewModel {
    var titleSession: String { get }
    var type: TripViewModelType { get }
    var trips: [Trip] { get set }
    var numberLines: Int { get }
}
