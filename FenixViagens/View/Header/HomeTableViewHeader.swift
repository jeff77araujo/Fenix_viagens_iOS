//
//  HomeTableViewHeader.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 17/12/21.
//

import UIKit

class HomeTableViewHeader: UIView {

    static var identifier = String(describing: HomeTableViewHeader.self)
    
    @IBOutlet weak var titleLabel: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var bannerMainView: UIView!
    
    func configView() {
        bannerMainView.layer.cornerRadius = 10
        bannerMainView.layer.masksToBounds = true
        
        headerView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500 : 200
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
}
