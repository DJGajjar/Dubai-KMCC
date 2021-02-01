//
//  PayRequestViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit

class PayRequestViewController: UIViewController {

    @IBOutlet var txtAmount: UITextField!
    @IBOutlet var btnSelectAction: UIButton!
    
    @IBOutlet weak var tblAction: UITableView!
    
    @IBOutlet var constHeihgtView: NSLayoutConstraint!
    @IBOutlet var constTitleHeight: NSLayoutConstraint!
    
    @IBOutlet var viewAction: UIView!
    
    var actionArray = ["Renewal","Topup"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtAmount.leftView = AppDelegate().getTextFieldLeftAndRightView()
        txtAmount.rightView = AppDelegate().getTextFieldLeftAndRightView()
        txtAmount.leftViewMode = .always
        txtAmount.rightViewMode = .always
        txtAmount.layer.borderColor = UIColor.borderColor.cgColor

        viewAction.layer.borderColor = UIColor.borderColor.cgColor
        
        constHeihgtView.constant = 66.0
        
        self.tblAction.register(UINib(nibName: "ActionCell", bundle: nil), forCellReuseIdentifier: "ActionCell")
        
        if SharedFunctions.sharedInstance().isiPhone6() ||  SharedFunctions.sharedInstance().isiPhone6P() {
            constTitleHeight.constant = 20.0
        }else {
            constTitleHeight.constant = 45.0
        }
    }
    
    @IBAction func btnSelectAction(_ sender: UIButton) {
        
        if self.viewAction.isHidden == false {
            self.viewAction.isHidden = true
        }else {
            self.viewAction.isHidden = false
        }
    }
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        self.viewAction.isHidden = true
    }
}

//MARK:- Tableview Delegate Datasource
extension PayRequestViewController : UITableViewDelegate, UITableViewDataSource {
             
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.actionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let actionCell = tableView.dequeueReusableCell(withIdentifier: "ActionCell") as! ActionCell
        
        actionCell.lblAction.text = self.actionArray[indexPath.row]
        actionCell.selectionStyle = .none
        
        return actionCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 33
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        btnSelectAction.setTitle(self.actionArray[indexPath.row], for: .normal)
        
        self.viewAction.isHidden = true
    }
}
