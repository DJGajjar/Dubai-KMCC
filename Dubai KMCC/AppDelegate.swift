//
//  AppDelegate.swift
//  Dubai KMCC
//
//  Created by Augmenta on 25/12/20.
//

import UIKit
import SideMenuSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        for family in UIFont.familyNames {
            print("\(family)")

            for name in UIFont.fontNames(forFamilyName: family) {
                print("\(name)")
            }
        }
        
        #if DEBUG
        var arguments = ProcessInfo.processInfo.arguments
        arguments.removeFirst()
        setupTestingEnvironment(with: arguments)
        #endif
        
        configureSideMenu()
        
        return true
    }
    
    private func configureSideMenu() {
        
        let sideMenuController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenu")
        UIApplication.shared.keyWindow?.rootViewController = sideMenuController
        
        SideMenuController.preferences.basic.menuWidth = UIScreen.main.bounds.size.width - 100
        SideMenuController.preferences.basic.defaultCacheKey = "0"
    }

}

#if DEBUG
extension AppDelegate {
    private func setupTestingEnvironment(with arguments: [String]) {
        if arguments.contains("SwitchToRight") {
            SideMenuController.preferences.basic.direction = .right
        }
    }
}
#endif
