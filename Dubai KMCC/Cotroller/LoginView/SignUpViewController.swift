//
//  SignUpViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtCPassword: UITextField!
    @IBOutlet var txtWelfareCardID: UITextField!
    @IBOutlet var txtMobileNumber: UITextField!
    @IBOutlet var txtEmailID: UITextField!
    @IBOutlet var txtWatsappNumber: UITextField!
    @IBOutlet var txtEmiratesID: UITextField!
    
    @IBOutlet var btnExisting: UIButton!
    @IBOutlet var btnNewUser: UIButton!
    
    @IBOutlet var selectEView: UIView!
    @IBOutlet var selectNView: UIView!
    
    @IBOutlet var constHeihgtWelfare: NSLayoutConstraint!
    @IBOutlet var constHeihgtNewUser: NSLayoutConstraint!
    @IBOutlet var constHeihgtView: NSLayoutConstraint!
    
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
        
        txtCPassword.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtCPassword.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtCPassword.leftViewMode = .always
        txtCPassword.rightViewMode = .always
        
        txtWelfareCardID.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtWelfareCardID.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtWelfareCardID.leftViewMode = .always
        txtWelfareCardID.rightViewMode = .always
        
        txtMobileNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtMobileNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtMobileNumber.leftViewMode = .always
        txtMobileNumber.rightViewMode = .always
        
        txtEmailID.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmailID.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmailID.leftViewMode = .always
        txtEmailID.rightViewMode = .always
        
        txtWatsappNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtWatsappNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtWatsappNumber.leftViewMode = .always
        txtWatsappNumber.rightViewMode = .always
        
        txtEmiratesID.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmiratesID.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmiratesID.leftViewMode = .always
        txtEmiratesID.rightViewMode = .always
        
        constHeihgtWelfare.constant = 120.0
        constHeihgtNewUser.constant = 0.0
        constHeihgtView.constant = 480.0
        
        selectEView.isHidden = false
        selectNView.isHidden = true
    }

    @IBAction func btnExistingUserAction(_ sender: UIButton) {
        constHeihgtWelfare.constant = 120.0
        constHeihgtNewUser.constant = 0.0
        constHeihgtView.constant = 480.0
        
        selectEView.isHidden = false
        selectNView.isHidden = true
        
        btnExisting.setTitleColor(UIColor.btnSelectColor, for: .normal)
        btnNewUser.setTitleColor(UIColor.btnUnselectColor, for: .normal)
    }
    
    @IBAction func btnNewUserAction(_ sender: UIButton) {
        constHeihgtWelfare.constant = 0.0
        constHeihgtNewUser.constant = 180.0
        constHeihgtView.constant = 600.0
        
        selectEView.isHidden = true
        selectNView.isHidden = false
        
        btnExisting.setTitleColor(UIColor.btnUnselectColor, for: .normal)
        btnNewUser.setTitleColor(UIColor.btnSelectColor, for: .normal)
    }
    
    @IBAction func btnSignUpAction(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
}
