//
//  AboutUsViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 26/12/20.
//

import UIKit
import MessageUI

class AboutUsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var btnBack: UIButton!
    @IBOutlet var btnSideMenu: UIButton!
    
    @IBOutlet var viewMail: UIView!
    @IBOutlet var viewPhone: UIView!
    
    @IBOutlet var lblAbout: UILabel!
    
    @IBOutlet var constTitleHeight: NSLayoutConstraint!
    
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
        viewMail.layer.shadowColor = UIColor.lightGray.cgColor
        viewMail.layer.shadowOpacity = 0.5
        viewMail.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewMail.layer.shadowRadius = 3
        viewMail.layer.cornerRadius = 25
        
        viewPhone.layer.masksToBounds = false
        viewPhone.layer.shadowColor = UIColor.lightGray.cgColor
        viewPhone.layer.shadowOpacity = 0.5
        viewPhone.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewPhone.layer.shadowRadius = 3
        viewPhone.layer.cornerRadius = 25
        
        
        lblAbout.text = "Kerala Muslim Cultural Centre is a social organisation approved by the Community Development Authority of Dubai Municipality; it is the largest of its kind for the expatriate Community in Middle East in terms of its variety of social and cultural activities and members whose number could be added up to fifty thousand. We have been fortunate, from a number of past years, to accomplish numerous social and cultural activities"
        
        let textString : String! = lblAbout.text
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.justified

        let attributedString = NSAttributedString(string: textString,
            attributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.baselineOffset: NSNumber(value: 0)
            ])
        lblAbout.attributedText = attributedString
        
        if SharedFunctions.sharedInstance().isiPhone6() ||  SharedFunctions.sharedInstance().isiPhone6P() {
            constTitleHeight.constant = 20.0
        }else {
            constTitleHeight.constant = 45.0
        }
    }
    
    @IBAction func btnMailAction(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["dubakmcc@eim.ae"])
            mail.setMessageBody("", isHTML: true)
            present(mail, animated: true)
        }
    }
    
    @IBAction func btnPhoneAction(_ sender: UIButton) {
        if let phoneCallURL = URL(string: "telprompt://\("04-2727773")") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                     application.openURL(phoneCallURL as URL)
                }
            }
        }
    }
    
    @IBAction func btnLinkAction(_ sender: UIButton) {
        if let url = URL(string: "http://www.hashtaguae.com/") {
            UIApplication.shared.open(url)
        }
    }
        
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
