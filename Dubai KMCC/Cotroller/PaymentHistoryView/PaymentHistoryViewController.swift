//
//  PaymentHistoryViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit

class PaymentHistoryViewController: UIViewController {

    @IBOutlet weak var tblPayHistory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tblPayHistory.register(UINib(nibName: "PaymentHisCell", bundle: nil), forCellReuseIdentifier: "PaymentHistoryCell")
        self.tblPayHistory.register(UINib(nibName: "DateHeader", bundle: nil), forCellReuseIdentifier: "DateHeader")
    }

}

//MARK:- Tableview Delegate Datasource
extension PaymentHistoryViewController : UITableViewDelegate, UITableViewDataSource {
         
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "DateHeader") as! DateHeader
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 50
        }else {
            return 15
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 20))
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let payHistoryCell = tableView.dequeueReusableCell(withIdentifier: "PaymentHistoryCell") as! PaymentHisCell
        
        payHistoryCell.selectionStyle = .none
        
        return payHistoryCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ClickPayHistory")
    }
}
