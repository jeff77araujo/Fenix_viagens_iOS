//
//  DetailsViewController.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 27/12/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    static var identifier = String(describing: DetailsViewController.self)
    
    // MARK: Outlets
    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var buttonContinue: UIButton!
    @IBOutlet weak var buttonCustom: UIView!
    @IBOutlet weak var dailyLabel: UILabel!
    @IBOutlet weak var priceDefaultLabel: UILabel!
    @IBOutlet weak var priceNewLabel: UILabel!
    
    
    // MARK: Attributes
    var trip: Trip?
    
    // MARK: View Life Cycle
    
    class func instance(_ trip: Trip) -> DetailsViewController {
        let detailsViewController = DetailsViewController(nibName: DetailsViewController.identifier, bundle: nil)
        detailsViewController.trip = trip
        
        return detailsViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCell(trip)
    }
    
    func configCell(_ trip: Trip?) {
        tripImageView.image = UIImage(named: trip?.asset ?? "")
        titleLabel.text = trip?.titulo
        subtitleLabel.text = trip?.subtitulo
        priceNewLabel.text = "R$ \(trip?.preco ?? 0)"
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(trip?.precoSemDesconto ?? 0)")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        priceDefaultLabel.attributedText = attributeString
        
        if let numberDays = trip?.diaria, let numberOfGuests = trip?.hospedes {
            let daily = numberDays == 1 ? "Diária" : "Diárias"
            let guest = numberOfGuests == 1 ? "Pessoa" : "Pessoas"
            
            dailyLabel.text = "\(numberDays) \(daily) - \(numberOfGuests) \(guest)"
        }
        
        DispatchQueue.main.async {
            self.buttonContinue.layer.cornerRadius = 8
            self.buttonCustom.layer.cornerRadius = 8
        }
    }
    
    
    // MARK: Actions
    @IBAction func buttonBack(_ sender: Any) {
        print("botao voltar")
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonContinue(_ sender: Any) {
        router(bool: true)
    }
    
    // MARK: ROUTER
    func router(bool: Bool) {
        let rootVC = UIViewController() // ou o nome da viewController que deseja abrir
        rootVC.view.backgroundColor = .systemRed
        
        if bool == true {
            // MARK: present
            rootVC.title = "New Screen with Present"
            let navVC = UINavigationController(rootViewController: rootVC)
            //        navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        } else {
            // MARK: NavigationController
            rootVC.title = "New Screen with NavController"
            navigationController?.pushViewController(rootVC, animated: true)
        }
        
        //  MARK: Como instanciar uma tela
//        let storyBoard = UIStoryboard(name: "identifierInLayout", bundle: nil).instantiateViewController(identifier: "nameViewController")
//        let nib = nameViewController(nibName: "nameViewController", bundle: nil)
        // MARK: Logo depois de instanciar, é só efetuar um present ou pushViewController para abrir a tela
    }
}
