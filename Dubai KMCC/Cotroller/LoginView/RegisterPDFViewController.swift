//
//  RegisterPDFViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 18/01/21.
//

import UIKit
import PDFKit

class RegisterPDFViewController: UIViewController {

    @IBOutlet var pdfView: PDFView!
    
    @IBOutlet var constTitleHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let path = Bundle.main.path(forResource: "registerterms", ofType: "pdf") {
            if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)) {
                pdfView.displayMode = .singlePageContinuous
                pdfView.autoScales = true
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
            }
        }
        
        if SharedFunctions.sharedInstance().isiPhone6() ||  SharedFunctions.sharedInstance().isiPhone6P() {
            constTitleHeight.constant = 20.0
        }else {
            constTitleHeight.constant = 45.0
        }
    }
}
