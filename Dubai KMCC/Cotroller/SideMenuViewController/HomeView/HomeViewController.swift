//
//  HomeViewController.swift
//  Dubai KMCC
//
//  Created by Augmenta on 25/12/20.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionInfo: UICollectionView!
    @IBOutlet var collectionEvent: UICollectionView!
    
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblMyBalance: UILabel!
    @IBOutlet var lblActivity_1: UILabel!
    @IBOutlet var lblActivity_2: UILabel!
    @IBOutlet var lblActivity_3: UILabel!
    @IBOutlet var lblNotificationCount: UILabel!
    
    @IBOutlet var viewInfo: UIView!
    @IBOutlet var viewEditProfile: UIView!
    @IBOutlet var viewActivity_1: UIView!
    @IBOutlet var viewActivity_2: UIView!
    @IBOutlet var viewActivity_3: UIView!
    
    @IBOutlet var imgActivity_1: UIImageView!
    @IBOutlet var imgActivity_2: UIImageView!
    @IBOutlet var imgActivity_3: UIImageView!
    
    @IBOutlet var constHeightProfile: NSLayoutConstraint!
    @IBOutlet var constHeightView: NSLayoutConstraint!
    
    var bannerDataArray = ["Slider_1","Slider_2",""]
    var galleryArray = ["Gallery_3","Gallery_4","Gallery_1","Gallery_5","Gallery_2"]
    
    var isLogin: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let scale: Bool = true
        
        viewInfo.layer.shadowColor = UIColor.shadowColor.cgColor
        viewInfo.layer.borderColor = UIColor.borderColor.cgColor
        viewInfo.layer.shadowOpacity = 0.4
        viewInfo.layer.shadowOffset = CGSize(width: -1, height: 1)
        viewInfo.layer.shadowRadius = 5
//        viewInfo.layer.shadowPath = UIBezierPath(rect: viewInfo.bounds).cgPath
        viewInfo.layer.shouldRasterize = true
        viewInfo.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
        viewEditProfile.layer.masksToBounds = false
        viewEditProfile.layer.shadowColor = UIColor.shadowColor.cgColor
        viewEditProfile.layer.shadowOpacity = 0.5
        viewEditProfile.layer.shadowOffset = CGSize(width: -1, height: 1)
        viewEditProfile.layer.shadowRadius = 5
        viewEditProfile.layer.shadowPath = UIBezierPath(rect: viewEditProfile.bounds).cgPath
        viewEditProfile.layer.shouldRasterize = true
        viewEditProfile.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
        viewActivity_1.layer.shadowColor = UIColor.shadowColor.cgColor
        viewActivity_1.layer.shadowOpacity = 0.5
        viewActivity_1.layer.shadowOffset = CGSize(width: -1, height: 1)
        viewActivity_1.layer.shadowRadius = 5
//        viewActivity_1.layer.shadowPath = UIBezierPath(rect: viewActivity_1.bounds).cgPath
        viewActivity_1.layer.shouldRasterize = true
        viewActivity_1.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
        viewActivity_2.layer.shadowColor = UIColor.shadowColor.cgColor
        viewActivity_2.layer.shadowOpacity = 0.5
        viewActivity_2.layer.shadowOffset = CGSize(width: -1, height: 1)
        viewActivity_2.layer.shadowRadius = 5
//        viewActivity_2.layer.shadowPath = UIBezierPath(rect: viewEditProfile.bounds).cgPath
        viewActivity_2.layer.shouldRasterize = true
        viewActivity_2.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
        viewActivity_3.layer.shadowColor = UIColor.shadowColor.cgColor
        viewActivity_3.layer.shadowOpacity = 0.5
        viewActivity_3.layer.shadowOffset = CGSize(width: -1, height: 1)
        viewActivity_3.layer.shadowRadius = 5
//        viewActivity_3.layer.shadowPath = UIBezierPath(rect: viewEditProfile.bounds).cgPath
        viewActivity_3.layer.shouldRasterize = true
        viewActivity_3.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
        self.collectionInfo.reloadData()
        
        self.startTimer()
        
        isLogin = UserDefaults.standard.object(forKey: ISLOGIN) as? String ?? "No"
        
        if isLogin == "No" {
            lblActivity_1.text = "Welfare Login"
            lblActivity_2.text = "Gallery"
            lblActivity_3.text = "About Us"
            
            imgActivity_1.image = UIImage(named: "PayRequest")
            imgActivity_2.image = UIImage(named: "GalleryIcon")
            imgActivity_3.image = UIImage(named: "AboutusIcon")
            
            constHeightProfile.constant = 0.0
            constHeightView.constant = 580.0
        }else if isLogin == "SideMenuLogOut" {
            UserDefaults.standard.set("No", forKey: ISLOGIN)
            
            AppDelegate().configureSideMenu()
            
            lblActivity_1.text = "Welfare Login"
            lblActivity_2.text = "Gallery"
            lblActivity_3.text = "About Us"
            
            imgActivity_1.image = UIImage(named: "PayRequest")
            imgActivity_2.image = UIImage(named: "GalleryIcon")
            imgActivity_3.image = UIImage(named: "AboutusIcon")
            
            constHeightProfile.constant = 0.0
            constHeightView.constant = 580.0
        }else {
            lblActivity_1.text = "Payment History"
            lblActivity_2.text = "Pay \n Request"
            lblActivity_3.text = "Renew \n Card"
            
            imgActivity_1.image = UIImage(named: "PaymenIcon")
            imgActivity_2.image = UIImage(named: "PayRequest")
            imgActivity_3.image = UIImage(named: "RenewCard")
            
            constHeightProfile.constant = 150.0
            constHeightView.constant = 720.0
        }
    }
    
    @IBAction func btnNotificationAction(_ sender: UIButton) {
        performSegue(withIdentifier: "NotificationView", sender: nil)
    }
    
    @IBAction func btnEditProfileAction(_ sender: UIButton) {
        performSegue(withIdentifier: "EditProfileView", sender: nil)
    }
    
    @IBAction func btnActivity_1Action(_ sender: UIButton) {
        
        if isLogin == "No" {
            performSegue(withIdentifier: "LoginView", sender: nil)
        }else {
            performSegue(withIdentifier: "PaymentView", sender: nil)
        }
    }
    
    @IBAction func btnActivity_2Action(_ sender: UIButton) {
        
        if isLogin == "No" {
            performSegue(withIdentifier: "GalleryView", sender: nil)
        }else {
            performSegue(withIdentifier: "PayRequestView", sender: nil)
        }
    }
    
    @IBAction func btnActivity_3Action(_ sender: UIButton) {
        
        if isLogin == "No" {
            UserDefaults.standard.set("HomeView", forKey: ABOUTUSACTION)
            performSegue(withIdentifier: "AboutUsView", sender: nil)
        }else {
            performSegue(withIdentifier: "RenewCardView", sender: nil)
        }
        
    }
    
    @IBAction func btnViewAllAction(_ sender: UIButton) {
        performSegue(withIdentifier: "GalleryView", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView  == collectionInfo {
            return bannerDataArray.count
        }else{
            return galleryArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        if collectionView  == collectionInfo {
            let items = bannerDataArray[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"InfoCell", for: indexPath as IndexPath)
            let image_sercice : UIImageView = cell.contentView.viewWithTag(1001) as! UIImageView
            image_sercice.image = UIImage(named: items)
//            let urls = URL.init(string: items)
//               image_sercice.sd_setImage(with: urls , placeholderImage: nil)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"EventCell", for: indexPath as IndexPath)
            let imageUrl = self.galleryArray[indexPath.row]
            let profileImageView : UIImageView = cell.contentView.viewWithTag(1010) as! UIImageView
            profileImageView.image = UIImage(named: imageUrl)
//            let urls = URL.init(string: imageUrl)
//            profileImageView.sd_setImage(with: urls , placeholderImage: nil)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if collectionView  == collectionInfo {
                      
        }else {
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "OfferScreenVC") as! OfferScreenVC
//            nextViewController.categoryArray.append(contentsOf: offerCategoryArray)
//            self.present(nextViewController, animated: true, completion: nil)
        }
           
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView  == collectionInfo {
            return CGSize(width: collectionInfo.frame.size.width, height: collectionInfo.frame.size.height)
        }else {
            return CGSize(width: collectionEvent.frame.size.width - 20, height: collectionEvent.frame.size.height)
        }
    }
    
    func startTimer() {

     _ =  Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
     }

     @objc func scrollAutomatically(_ timer1: Timer) {
         if let coll  = collectionInfo {
             for cell in coll.visibleCells {
                 let indexPath: IndexPath? = coll.indexPath(for: cell)
                 if ((indexPath?.row)! < bannerDataArray.count - 1){
                     let indexPath1: IndexPath?
                     indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                     coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                 }
                 else{
                     let indexPath1: IndexPath?
                     indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                     coll.scrollToItem(at: indexPath1!, at: .left, animated: false)
                 }
             }
         }
     }
}
