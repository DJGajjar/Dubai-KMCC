//
//  LoginViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit
import SideMenuSwift

class LoginViewController: UIViewController {

    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtUsername.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtUsername.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtUsername.leftViewMode = .always
        txtUsername.rightViewMode = .always
        
        txtPassword.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtPassword.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtPassword.leftViewMode = .always
        txtPassword.rightViewMode = .always
    }
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        
        print("Data PRI>> \(String(describing: txtUsername.text))")
        if txtUsername.text != "" && txtPassword.text != "" {
            UserDefaults.standard.set("Yes", forKey: ISLOGIN)
            AppDelegate().configureSideMenu()
        }
        
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func btnForgotPasswordAction(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgotPasswordView", sender: nil)
    }
    
    @IBAction func btnSignInAction(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUpView", sender: nil)
    }

}
