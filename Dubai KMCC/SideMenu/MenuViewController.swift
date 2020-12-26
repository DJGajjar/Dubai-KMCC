//
//  MenuViewController.swift
//  SideMenuDemo
//
//  Created by Augmenta on 07/12/20.
//

import UIKit
import SideMenuSwift

class Preferences {
    static let shared = Preferences()
    var enableTransitionAnimation = false
}

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
        }
    }
    
    @IBOutlet weak var selectionMenuTrailingConstraint: NSLayoutConstraint!
    
    var isDarkModeEnabled = false
    private var themeColor = UIColor.white

    override func viewDidLoad() {
        super.viewDidLoad()

        isDarkModeEnabled = SideMenuController.preferences.basic.position == .under
        configureView()
        
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: "HomeView")
        }, with: "0")

        sideMenuController?.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[Example] Menu did appear")
    }

    private func configureView() {
        if isDarkModeEnabled {
            themeColor = UIColor(red: 0.03, green: 0.04, blue: 0.07, alpha: 1.00)
        } else {
            themeColor = UIColor(red: 0.98, green: 0.97, blue: 0.96, alpha: 1.00)
        }

        let sidemenuBasicConfiguration = SideMenuController.preferences.basic
        let showPlaceTableOnLeft = (sidemenuBasicConfiguration.position == .under) != (sidemenuBasicConfiguration.direction == .right)
        if showPlaceTableOnLeft {
            selectionMenuTrailingConstraint.constant = SideMenuController.preferences.basic.menuWidth - view.frame.width
        }

        view.backgroundColor = themeColor
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        let sideMenuBasicConfiguration = SideMenuController.preferences.basic
        let showPlaceTableOnLeft = (sideMenuBasicConfiguration.position == .under) != (sideMenuBasicConfiguration.direction == .right)
        selectionMenuTrailingConstraint.constant = showPlaceTableOnLeft ? SideMenuController.preferences.basic.menuWidth - size.width : 0
        view.layoutIfNeeded()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelectionCell
        
        cell.titleLabel.text = ["Home"][indexPath.row]
        
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row

        if indexPath.row != 0 {
            sideMenuController?.setContentViewController(with: "\(row)", animated: Preferences.shared.enableTransitionAnimation)
            
            
            if let identifier = sideMenuController?.currentCacheIdentifier() {
                print("[Example] View Controller Cache Identifier: \(identifier)")
            }
        }
//        else if indexPath.row != 1 {
//            sideMenuController?.setContentViewController(with: "\(row)", animated: Preferences.shared.enableTransitionAnimation)
//
//
//            if let identifier = sideMenuController?.currentCacheIdentifier() {
//                print("[Example] View Controller Cache Identifier: \(identifier)")
//            }
//        }
        sideMenuController?.hideMenu()
    }
    
}
extension MenuViewController: SideMenuControllerDelegate {
    func sideMenuController(_ sideMenuController: SideMenuController,
                            animationControllerFrom fromVC: UIViewController,
                            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BasicTransitionAnimator(options: .transitionFlipFromLeft, duration: 0.6)
    }

    func sideMenuController(_ sideMenuController: SideMenuController, willShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller will show [\(viewController)]")
    }

    func sideMenuController(_ sideMenuController: SideMenuController, didShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller did show [\(viewController)]")
    }

    func sideMenuControllerWillHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will hide")
    }

    func sideMenuControllerDidHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did hide.")
    }

    func sideMenuControllerWillRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will reveal.")
    }

    func sideMenuControllerDidRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did reveal.")
    }
}


class SelectionCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}


class NavigationController: UINavigationController {

    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }

    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
