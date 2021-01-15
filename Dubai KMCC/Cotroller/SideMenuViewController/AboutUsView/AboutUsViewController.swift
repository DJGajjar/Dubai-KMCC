//
//  AboutUsViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet var btnBack: UIButton!
    @IBOutlet var btnSideMenu: UIButton!
    
    @IBOutlet var viewMail: UIView!
    @IBOutlet var viewPhone: UIView!
    
    var isOpenOpt: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        isOpenOpt = UserDefaults.standard.object(forKey: ABOUTUSACTION) as? String ?? "No"
        
        if isOpenOpt == "AboutP" {
            btnBack.isHidden = true
            btnSideMenu.isHidden = false
        }else {
            btnBack.isHidden = false
            btnSideMenu.isHidden = true
        }
        
        viewMail.layer.masksToBounds = false
        viewMail.layer.shadowColor = UIColor.darkGray.cgColor
        viewMail.layer.shadowOpacity = 0.5
        viewMail.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewMail.layer.shadowRadius = 3
        viewMail.layer.cornerRadius = 25
        
        viewPhone.layer.masksToBounds = false
        viewPhone.layer.shadowColor = UIColor.darkGray.cgColor
        viewPhone.layer.shadowOpacity = 0.5
        viewPhone.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewPhone.layer.shadowRadius = 3
        viewPhone.layer.cornerRadius = 25
    }
    
    @IBAction func btnMailAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnPhoneAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnLinkAction(_ sender: UIButton) {
        
    }
}
