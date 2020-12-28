//
//  MyProfileViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet var txtFullName: UITextField!
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var txtMobileNumber: UITextField!
    @IBOutlet var txtWhatsappNumber: UITextField!
    @IBOutlet var txtEmailAddress: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtFullName.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtFullName.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtFullName.leftViewMode = .always
        txtFullName.rightViewMode = .always
        
        txtUserName.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtUserName.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtUserName.leftViewMode = .always
        txtUserName.rightViewMode = .always
        
        txtMobileNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtMobileNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtMobileNumber.leftViewMode = .always
        txtMobileNumber.rightViewMode = .always
        txtMobileNumber.layer.borderColor = UIColor.borderColor.cgColor
        
        txtWhatsappNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtWhatsappNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtWhatsappNumber.leftViewMode = .always
        txtWhatsappNumber.rightViewMode = .always
        txtWhatsappNumber.layer.borderColor = UIColor.borderColor.cgColor
        
        txtEmailAddress.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmailAddress.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmailAddress.leftViewMode = .always
        txtEmailAddress.rightViewMode = .always
        txtEmailAddress.layer.borderColor = UIColor.borderColor.cgColor
    }

    @IBAction func btnSelectProfilePicAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnSaveChangesAction(_ sender: UIButton) {
        
    }
}
