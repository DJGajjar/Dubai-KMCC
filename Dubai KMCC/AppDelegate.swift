//
//  AppDelegate.swift
//  Dubai KMCC
//
//  Created by Augmenta on 25/12/20.
//

import UIKit
import SideMenuSwift
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func sharedAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        IQKeyboardManager.shared.enable = true
        
        #if DEBUG
        var arguments = ProcessInfo.processInfo.arguments
        arguments.removeFirst()
        setupTestingEnvironment(with: arguments)
        #endif
        
        configureSideMenu()
        
        return true
    }
    
    func configureSideMenu() {
        
        let sideMenuController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenu")
        UIApplication.shared.keyWindow?.rootViewController = sideMenuController
        
        SideMenuController.preferences.basic.menuWidth = UIScreen.main.bounds.size.width - 100
        SideMenuController.preferences.basic.defaultCacheKey = "0"
    }

    // MARK - TextField Padding Method
    
    func getTextFieldLeftAndRightView() -> UIView {
        let paddingView: UIView = UIView.init(frame: CGRect(x:0, y: 0, width:10, height:10))
        return paddingView
        
    }
    
    func getTextFieldLeftAndRightViewInEditProfile() -> UIView {
        let paddingView: UIView = UIView.init(frame: CGRect(x:0, y: 0, width:10, height:5))
        return paddingView
    }
    
    func getTextFieldLeftAndRight_1View() -> UIView {
        let paddingView: UIView = UIView.init(frame: CGRect(x:0, y: 0, width:10, height:10))
        return paddingView
        
    }
    
    func getTextFieldLeftAndRightViewInEdit_1Profile() -> UIView {
        let paddingView: UIView = UIView.init(frame: CGRect(x:0, y: 0, width:10, height:5))
        return paddingView
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
