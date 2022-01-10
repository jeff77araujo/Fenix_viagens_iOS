//
//  ViewController.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 17/12/21.
//

import UIKit 

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewTrip: UITableView!
    
//    MARK: ROUTER FOR PRESENT
//        let rootVC = TesteViewController()
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//        
    //    MARK: ROUTER FOR NAVIGATIONCONTROLLER
//        let vc = TesteViewController()
////        let vc = UIViewController()
////        vc.view.backgroundColor = .red
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        view.backgroundColor = UIColor(red: 43.0/255.0, green: 42.0/255.0, blue: 41.0/255.0, alpha: 1)
    }
    
    func configTableView() {
        tableViewTrip.register(UINib(nibName: TripTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TripTableViewCell.identifier)
        tableViewTrip.register(UINib(nibName: OffersTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OffersTableViewCell.identifier)
        tableViewTrip.register(UINib(nibName: InternationalTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: InternationalTableViewCell.identifier)
        tableViewTrip.dataSource = self
        tableViewTrip.delegate = self
    }
    
    func routerDetailsViewController(_ trip: Trip?) {
        if let tripSelected = trip {
            let detailsController = DetailsViewController.instance(tripSelected)
            navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessionOfTrips?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sessionOfTrips?[section].titleSession.uppercased() == "OFERTAS" {
            return 1
        } else {
            return sessionOfTrips?[section].numberLines ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sessionOfTrips?[indexPath.section]
        
        switch viewModel?.type {
        case .highlights:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TripTableViewCell.identifier, for: indexPath) as? TripTableViewCell else { fatalError("Error to create TripTableViewCell") }

            cell.configCell(viewModel?.trips[indexPath.row])
            return cell
        
        case .offers:
            guard let cellOffer = tableView.dequeueReusableCell(withIdentifier: OffersTableViewCell.identifier, for: indexPath) as? OffersTableViewCell else { fatalError("Error to create OffersTableViewCell") }
//            if indexPath.row == 0 {
                cellOffer.delegate = self
                cellOffer.configCell(viewModel?.trips)
                return cellOffer
//            }
//
//            return UITableViewCell()
            
        case .international:
            guard let cellInter = tableView.dequeueReusableCell(withIdentifier: InternationalTableViewCell.identifier, for: indexPath) as? InternationalTableViewCell else { fatalError("Error to create OffersTableViewCell") }
            
            cellInter.configCell(viewModel?.trips[indexPath.row])
            
            return cellInter
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewModel = sessionOfTrips?[indexPath.section]
        
        switch viewModel?.type {
        case .highlights, .international:
            let tripSelected = viewModel?.trips[indexPath.row]
            routerDetailsViewController(tripSelected)
        case .offers:
            let offerSelected = viewModel?.trips[indexPath.row]
            routerDetailsViewController(offerSelected)
        default: break
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            let headerView = Bundle.main.loadNibNamed(HomeTableViewHeader.identifier, owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configView()
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 300
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 480
    }
}

extension ViewController: OffersTableViewCellDelegate {
    func didSelectView(_ trip: Trip?) {
        routerDetailsViewController(trip)
    }
}
