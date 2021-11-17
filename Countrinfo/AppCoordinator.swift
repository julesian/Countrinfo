//
//  AppCoordinator.swift
//  Countrinfo
//
//  Created by Jules Gilos on 11/17/21.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    private var navigationController = CountryNavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let vc = CountryListViewController.instantiate(with: CountryListViewModel())
        vc.coordinator = self
        navigationController = CountryNavigationController(rootViewController: vc)
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func countryDetails(viewModel: CountryDetailsViewModel) {
        let vc = CountryDetailsViewController.instantiate(with: viewModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

