//
//  InternationalTableViewCell.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 27/12/21.
//

import UIKit

class InternationalTableViewCell: UITableViewCell {
    
    static var identifier = String(describing: InternationalTableViewCell.self)

    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var titleTripLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var dailyTripLabel: UILabel!
    @IBOutlet weak var priceDefaultLabel: UILabel!
    @IBOutlet weak var priceNewLabel: UILabel!
    @IBOutlet weak var cancelOptionLabel: UILabel!
    
    func configCell(_ trip: Trip?) {
        tripImageView.image = UIImage(named: trip?.asset ?? "")
        titleTripLabel.text = trip?.titulo
        destinationLabel.text = trip?.subtitulo
        priceNewLabel.text = "R$ \(trip?.preco ?? 0)"
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(trip?.precoSemDesconto ?? 0)")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        priceDefaultLabel.attributedText = attributeString
        
        if let numberDays = trip?.diaria, let numberOfGuests = trip?.hospedes {
            let daily = numberDays == 1 ? "Diária" : "Diárias"
            let guest = numberOfGuests == 1 ? "Pessoa" : "Pessoas"
            
            dailyTripLabel.text = "\(numberDays) \(daily) - \(numberOfGuests) - \(guest)"
        }
        
        DispatchQueue.main.async {
            self.backgroundViewCell.addShadow()
        }
    }
    
}
