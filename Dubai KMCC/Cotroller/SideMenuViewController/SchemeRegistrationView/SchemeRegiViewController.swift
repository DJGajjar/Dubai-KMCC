//
//  SchemeRegiViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit

class SchemeRegiViewController: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtMobile: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtFatherName: UITextField!
    @IBOutlet var txtHouseno: UITextField!
    @IBOutlet var txtPlace: UITextField!
    @IBOutlet var txtEmiratesIdNumber: UITextField!
    @IBOutlet var txtExpiry: UITextField!
    @IBOutlet var txtNomineeName: UITextField!
    @IBOutlet var txtRelation: UITextField!
    @IBOutlet var txtHometownPhoneNumber: UITextField!
    @IBOutlet var txtUaeRelativeName: UITextField!
    @IBOutlet var txtRelativeMobileNumber: UITextField!
    
    @IBOutlet var btnDateofbirth: UIButton!
    @IBOutlet var btnPanchayatName: UIButton!
    @IBOutlet var btnMandalam: UIButton!
    @IBOutlet var btnJilla: UIButton!
    @IBOutlet var btnEmirate: UIButton!
    @IBOutlet var btnBack: UIButton!
    @IBOutlet var btnSideMenu: UIButton!
    
    @IBOutlet var viewImgUpload_1: UIView!
    @IBOutlet var viewImgUpload_2: UIView!
    
    @IBOutlet weak var tblAction: UITableView!
    
    @IBOutlet var viewAction: UIView!
    @IBOutlet var viewBack: UIView!
    
    @IBOutlet var constHeightAction: NSLayoutConstraint!
    
    var actionArray = ["Renewal","Renewal","Renewal","Renewal","Renewal"]
    
    var strBtnAction: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtName.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtName.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtName.leftViewMode = .always
        txtName.rightViewMode = .always
        
        txtMobile.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtMobile.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtMobile.leftViewMode = .always
        txtMobile.rightViewMode = .always
        
        txtEmail.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmail.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmail.leftViewMode = .always
        txtEmail.rightViewMode = .always
        
        txtFatherName.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtFatherName.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtFatherName.leftViewMode = .always
        txtFatherName.rightViewMode = .always
        
        txtHouseno.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtHouseno.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtHouseno.leftViewMode = .always
        txtHouseno.rightViewMode = .always
        
        txtPlace.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtPlace.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtPlace.leftViewMode = .always
        txtPlace.rightViewMode = .always
        
        txtEmiratesIdNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmiratesIdNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtEmiratesIdNumber.leftViewMode = .always
        txtEmiratesIdNumber.rightViewMode = .always
        
        txtExpiry.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtExpiry.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtExpiry.leftViewMode = .always
        txtExpiry.rightViewMode = .always
        
        txtNomineeName.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtNomineeName.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtNomineeName.leftViewMode = .always
        txtNomineeName.rightViewMode = .always
        
        txtRelation.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtRelation.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtRelation.leftViewMode = .always
        txtRelation.rightViewMode = .always
        
        txtHometownPhoneNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtHometownPhoneNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtHometownPhoneNumber.leftViewMode = .always
        txtHometownPhoneNumber.rightViewMode = .always
        
        txtUaeRelativeName.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtUaeRelativeName.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtUaeRelativeName.leftViewMode = .always
        txtUaeRelativeName.rightViewMode = .always
        
        txtRelativeMobileNumber.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtRelativeMobileNumber.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtRelativeMobileNumber.leftViewMode = .always
        txtRelativeMobileNumber.rightViewMode = .always
            
        viewAction.layer.borderColor = UIColor.borderColor.cgColor
        viewImgUpload_1.layer.borderColor = UIColor.appColor.cgColor
        viewImgUpload_2.layer.borderColor = UIColor.appColor.cgColor
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
//
//        viewBack.addGestureRecognizer(tapGestureRecognizer)
        
        viewAction.layer.shadowColor = UIColor.shadowColor.cgColor
        viewAction.layer.shadowOpacity = 0.5
        viewAction.layer.shadowOffset = CGSize(width: -1, height: 1)
        viewAction.layer.shadowRadius = 10
        viewAction.layer.shouldRasterize = true
        
        if !UIAccessibility.isReduceTransparencyEnabled {
            viewBack.backgroundColor = .clear

            let blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.viewBack.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            viewBack.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
            viewBack.addSubview(viewAction)
        } else {
            viewBack.backgroundColor = .white
        }
        
        self.tblAction.register(UINib(nibName: "ActionCell", bundle: nil), forCellReuseIdentifier: "ActionCell")
    }
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        print("did tap view", sender)
        viewBack.isHidden = true
    }
    
    @IBAction func btnPanchayatNameAction(_ sender: UIButton) {
        
        viewBack.isHidden = false
        viewAction.isHidden = false
        
        constHeightAction.constant = (UIScreen.main.bounds.size.height - 222)/2
        
        strBtnAction = "1"
    }
    
    @IBAction func btnMandalamAction(_ sender: UIButton) {
        
        viewBack.isHidden = false
        viewAction.isHidden = false
        
        constHeightAction.constant = (UIScreen.main.bounds.size.height - 222)/2
        
        strBtnAction = "2"
    }
    
    @IBAction func btnJillaAction(_ sender: UIButton) {
        
        viewBack.isHidden = false
        viewAction.isHidden = false
        
        constHeightAction.constant = (UIScreen.main.bounds.size.height - 222)/2
        
        strBtnAction = "3"
    }
    
    @IBAction func btnEmirateAction(_ sender: UIButton) {
        
        viewBack.isHidden = false
        viewAction.isHidden = false
        
        constHeightAction.constant = (UIScreen.main.bounds.size.height - 222)/2
        
        strBtnAction = "4"
    }
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        
    }
}

//MARK:- Tableview Delegate Datasource
extension SchemeRegiViewController : UITableViewDelegate, UITableViewDataSource {
             
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.actionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell") as! ActionCell
        
        actionCell.selectionStyle = .none

        actionCell.lblAction.text = self.actionArray[indexPath.row]
        
        return actionCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 33
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        if strBtnAction == "1" {
            btnPanchayatName.setTitle(self.actionArray[indexPath.row], for: .normal)
        }else if strBtnAction == "2" {
            btnMandalam.setTitle(self.actionArray[indexPath.row], for: .normal)
        }else if strBtnAction == "3" {
            btnJilla.setTitle(self.actionArray[indexPath.row], for: .normal)
        }else if strBtnAction == "4" {
            btnEmirate.setTitle(self.actionArray[indexPath.row], for: .normal)
        }
        
        self.viewAction.isHidden = true
        self.viewBack.isHidden = true
    }
}
