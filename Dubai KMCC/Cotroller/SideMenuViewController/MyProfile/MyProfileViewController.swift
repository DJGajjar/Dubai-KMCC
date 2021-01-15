//
//  MyProfileViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet var viewProfile: UIView!
    
    @IBOutlet var txtFullName: UITextField!
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var txtMobileNumber: UITextField!
    @IBOutlet var txtWhatsappNumber: UITextField!
    @IBOutlet var txtEmailAddress: UITextField!
    @IBOutlet var txtHouseno: UITextField!
    @IBOutlet var txtHometownPhoneNumber: UITextField!
    @IBOutlet var txtUaeRelativeName: UITextField!
    @IBOutlet var txtRelativeMobileNumber: UITextField!
    @IBOutlet var txtCurrentPassword: UITextField!
    @IBOutlet var txtNewPassword: UITextField!
    @IBOutlet var txtConfirmPassword: UITextField!

    @IBInspectable var underLineColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
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
        
        txtHouseno.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtHouseno.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtHouseno.leftViewMode = .always
        txtHouseno.rightViewMode = .always
        txtHouseno.layer.borderColor = UIColor.borderColor.cgColor
        
        txtHometownPhoneNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtHometownPhoneNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtHometownPhoneNumber.leftViewMode = .always
        txtHometownPhoneNumber.rightViewMode = .always
        txtHometownPhoneNumber.layer.borderColor = UIColor.borderColor.cgColor
        
        txtUaeRelativeName.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtUaeRelativeName.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtUaeRelativeName.leftViewMode = .always
        txtUaeRelativeName.rightViewMode = .always
        txtUaeRelativeName.layer.borderColor = UIColor.borderColor.cgColor
        
        txtRelativeMobileNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtRelativeMobileNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtRelativeMobileNumber.leftViewMode = .always
        txtRelativeMobileNumber.rightViewMode = .always
        txtRelativeMobileNumber.layer.borderColor = UIColor.borderColor.cgColor
        
        txtCurrentPassword.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtCurrentPassword.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtCurrentPassword.leftViewMode = .always
        txtCurrentPassword.rightViewMode = .always
        txtCurrentPassword.layer.borderColor = UIColor.borderColor.cgColor
        
        txtNewPassword.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtNewPassword.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtNewPassword.leftViewMode = .always
        txtNewPassword.rightViewMode = .always
        txtNewPassword.layer.borderColor = UIColor.borderColor.cgColor
        
        txtConfirmPassword.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtConfirmPassword.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtConfirmPassword.leftViewMode = .always
        txtConfirmPassword.rightViewMode = .always
        txtConfirmPassword.layer.borderColor = UIColor.borderColor.cgColor
        
    }

    @IBAction func btnSelectProfilePicAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnSaveChangesAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnUpdatePasswordAction(_ sender: UIButton) {
        
    }
}
