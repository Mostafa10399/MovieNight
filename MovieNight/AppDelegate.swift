//
//  AppDelegate.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import SwiftUI

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    
    // MARK: - Properties
    
    var window: UIWindow?
    let mainDependencyContainer = MainDependencyContainer()
    
    // MARK: - Methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        setupRootController(
            controller: mainDependencyContainer.makeMainNavigationController(),
            navigationBarHidden: true)
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIDevice.current.userInterfaceIdiom == .phone ? .portrait : .all
    }
    
}

extension AppDelegate{
    func setupRootController(controller: UIViewController, navigationBarHidden: Bool) {
            if let window = self.window {
                window.rootViewController = controller
                window.makeKeyAndVisible()
            }
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .dark
        }
            UINavigationBar.appearance().isHidden = navigationBarHidden
        }
}
