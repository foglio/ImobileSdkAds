//
//  FullScreenViewController.swift
//
//  FullScreenViewController.swift
//  ImobileSample-Swift
//
//  Created by i-mobile. on 2015/07/08.
//  Copyright © 2016年 i-mobile. All rights reserved.
//
import UIKit

class FullScreenViewController: UIViewController ,IMobileSdkAdsDelegate{
    
    var adDisplayInfo : AdDisplayInfo!
    
    var sid : String = ""
    
    @IBOutlet weak var readyLabel: UILabel!
    @IBOutlet weak var didShowLabel: UILabel!
    @IBOutlet weak var clickLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pid : String = adDisplayInfo.pid!
        let mid : String = adDisplayInfo.mid!
        sid = adDisplayInfo.sid!
        
        // スポット情報を設定します
        ImobileSdkAds.registerWithPublisherID(pid, mediaID:mid, spotID:sid)
        // デリゲートの登録
        ImobileSdkAds.setSpotDelegate(sid, delegate: self)
        // 広告の取得を開始します
        ImobileSdkAds.startBySpotID(sid)
        
    }
    
    @IBAction func showAd(sender: UIButton) {
        // 広告を表示します
        ImobileSdkAds.showBySpotID(sid)
    }
    
    // 広告の表示準備が完了した場合に呼ばれます
    func imobileSdkAdsSpot(spotId: String!, didReadyWithValue value: ImobileSdkAdsReadyResult) {
        readyLabel.textColor = UIColor.blackColor()
        didShowLabel.textColor = UIColor.lightGrayColor()
        clickLabel.textColor = UIColor.lightGrayColor()
        closeLabel.textColor = UIColor.lightGrayColor()
    }
    
    // 広告が表示された際に呼ばれます
    func imobileSdkAdsSpotDidShow(spotId: String!){
        didShowLabel.textColor = UIColor.blackColor()
    }
    
    // 広告をクリックした際に呼ばれます
    func imobileSdkAdsSpotDidClick(spotId: String!){
        clickLabel.textColor = UIColor.blackColor()
    }
    
    // 広告が閉じられた際に呼ばれます
    // 表示頻度設定している場合、表示処理がスキップされた際にも呼ばれます。
    func imobileSdkAdsSpotDidClose(spotId: String!){
        closeLabel.textColor = UIColor.blackColor()
        readyLabel.textColor = UIColor.grayColor()
    }
    
}

