//
//  LaunchScreenViewController.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 14/02/22.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var constraintTitleTop: NSLayoutConstraint!

    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initAnimation()
    }
    // MARK: Methods
    func initAnimation() {
        constraintTitleTop.constant = 430
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        } completion: { (_ ) in
            self.openHome()
        }
    }
    
    func openHome() {
        let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewController")
        let navController = UINavigationController(rootViewController: navigation)
        navController.setNavigationBarHidden(true, animated: false)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }

}
