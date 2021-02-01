//
//  RenewCardViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit

class RenewCardViewController: UIViewController {

    @IBOutlet var txtEmiratesNumber: UITextField!
    @IBOutlet var txtExpiry: UITextField!
    
    @IBOutlet var viewImgUpload_1: UIView!
    @IBOutlet var viewImgUpload_2: UIView!
    
    @IBOutlet var constTitleHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtEmiratesNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmiratesNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmiratesNumber.leftViewMode = .always
        txtEmiratesNumber.rightViewMode = .always
        
        txtExpiry.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtExpiry.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtExpiry.leftViewMode = .always
        txtExpiry.rightViewMode = .always
        
        viewImgUpload_1.layer.borderColor = UIColor.appColor.cgColor
        viewImgUpload_2.layer.borderColor = UIColor.appColor.cgColor
        
        if SharedFunctions.sharedInstance().isiPhone6() ||  SharedFunctions.sharedInstance().isiPhone6P() {
            constTitleHeight.constant = 20.0
        }else {
            constTitleHeight.constant = 45.0
        }
    }
    
    @IBAction func btnUploadImg1Action(_ sender: UIButton) {
        print("Upload 1")
    }
    
    @IBAction func btnUploadImg2Action(_ sender: UIButton) {
        print("Upload 2")
    }
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        print("Submit")
    }
}
