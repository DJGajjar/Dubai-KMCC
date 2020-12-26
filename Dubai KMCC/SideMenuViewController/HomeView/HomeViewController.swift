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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        constHeightProfile.constant = 150.0
        constHeightView.constant = 720.0
        
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
    }
    
    @IBAction func btnMenuAction(_ sender: UIButton)
    {
        sideMenuController?.revealMenu()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView  == collectionInfo {
            return bannerDataArray.count
        }else{
            return 10
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
//            let imageUrl = self.offerCategoryArray[indexPath.row]
//            let profileImageView : UIImageView = cell.contentView.viewWithTag(1010) as! UIImageView
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

     _ =  Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
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
