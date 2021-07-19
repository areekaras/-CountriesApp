//
//  AppCoordinator.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 19/07/21.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.tintColor = UIColor.label
    }
    
    func start() {
        let controller: CountriesTableViewController = CountriesTableViewController.instance()
        controller.coordinator = self
        navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func showCountryDetailView(_ viewModel: CountryProtocol) {
        let controller: CountryDetailsTableViewController = CountryDetailsTableViewController.instance()
        navigationController.navigationBar.prefersLargeTitles = true
        controller.countryViewModel = viewModel
        self.navigationController.pushViewController(controller, animated: true)
    }
}

