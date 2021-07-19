//
//  AppDelegate.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 18/07/21.
//

import UIKit
import SDWebImageSVGCoder

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpAppCoordinator()
        setUpSVGCoder()
        return true
    }
    
    func setUpAppCoordinator() {
        let navigationController: UINavigationController = UINavigationController()
        let appCoordinator: AppCoordinator = .init(navigationController: navigationController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        appCoordinator.start()
        window?.makeKeyAndVisible()
    }
    
    func setUpSVGCoder() {
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

}

