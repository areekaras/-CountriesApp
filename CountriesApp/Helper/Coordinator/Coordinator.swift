//
//  Coordinator.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 19/07/21.
//

import UIKit

protocol Coordinator {
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
