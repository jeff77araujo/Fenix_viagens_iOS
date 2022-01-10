//
//  OfferTableViewCell.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 22/12/21.
//

import UIKit

protocol OffersTableViewCellDelegate: AnyObject {
    func didSelectView(_ trip: Trip?)
}

class OffersTableViewCell: UITableViewCell {
    
    static var identifier = String(describing: OffersTableViewCell.self)

    @IBOutlet var shadowViews: [UIView]!
    @IBOutlet var tripImageViews: [UIImageView]!
    @IBOutlet var titleTripLabels: [UILabel]!
    @IBOutlet var subTitleLabels: [UILabel]!
    @IBOutlet var dailyTripLabels: [UILabel]!
    @IBOutlet var priceDefaultLabels: [UILabel]!
    @IBOutlet var priceNewLabels: [UILabel]!
    
    weak var delegate: OffersTableViewCellDelegate?
    private var trips: [Trip]?
    
    func configCell(_ trip: [Trip]?) {
        
        self.trips = trip
        guard let listTrip = trip else { return }
        
        for i in 0..<listTrip.count {
            setOutLets(i, trip: listTrip[i])
        }
        
        shadowViews.forEach { view in
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectView(_:))))
            view.addShadow()
        }
    }
    
    func setOutLets(_ index: Int, trip: Trip) {
        
        let imageOutlet = tripImageViews[index]
        imageOutlet.image = UIImage(named: trip.asset)
        
        let titleOutLet = titleTripLabels[index]
        titleOutLet.text = trip.titulo
        
        let subTitleOutLet = subTitleLabels[index]
        subTitleOutLet.text = trip.subtitulo
        
        let priceDefaultOutLet = priceDefaultLabels[index]
        priceDefaultOutLet.text = "R$ \(trip.precoSemDesconto)"
        
        let priceNewOutLet = priceNewLabels[index]
        priceNewOutLet.text = "R$ \(trip.preco)"
        
        let dailyTripOutLet = dailyTripLabels[index]
        let numberDays = trip.diaria
        let textDaily = numberDays == 1 ? "Diária": "Diárias"
        dailyTripOutLet.text = "\(numberDays) \(textDaily)"
    }
    
    @objc func didSelectView(_ gesture: UIGestureRecognizer) {
        
        if let selectedView = gesture.view {
            if let tripSelected = trips?[selectedView.tag] {
                delegate?.didSelectView(tripSelected)
            }
        }
    }
}
