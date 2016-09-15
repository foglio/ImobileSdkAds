//
//  InlineViewController.swift
//  ImobileSample-Swift
//
//  Created by i-mobile on 2015/07/08.
//  Copyright © 2016年 i-mobile. All rights reserved.
//
import UIKit

class InlineViewController: UIViewController,IMobileSdkAdsDelegate {

    var adDisplayInfo : AdDisplayInfo!
    
    @IBOutlet weak var readyLabel: UILabel!
    @IBOutlet weak var didShowLabel: UILabel!
    @IBOutlet weak var clickLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pid : String = adDisplayInfo.pid!
        let mid : String = adDisplayInfo.mid!
        let sid : String = adDisplayInfo.sid!
        
        // スポット情報を設定します
        ImobileSdkAds.registerWithPublisherID(pid, mediaID:mid, spotID:sid)
        // デリゲートの登録
        ImobileSdkAds.setSpotDelegate(sid, delegate: self)
        // 広告の取得を開始します
        ImobileSdkAds.startBySpotID(sid)
        
        let displayPoint : CGPoint = adDisplayInfo.adDisplayPosition
        let displaySize : CGSize = adDisplayInfo.size
        
        // 広告を表示するViewを作成します
        let imobileAdView = UIView(frame: CGRectMake(displayPoint.x, displayPoint.y,
                                                     displaySize.width, displaySize.height))
        //広告を表示するViewをViewControllerに追加します
        self.view.addSubview(imobileAdView)
        // 広告を表示します
        ImobileSdkAds.showBySpotID(sid, view: imobileAdView)
    }
    
    // 広告の表示準備が完了した場合に呼ばれます
    func imobileSdkAdsSpot(spotId: String!, didReadyWithValue value: ImobileSdkAdsReadyResult) {
        readyLabel.textColor = UIColor.blackColor()
        didShowLabel.textColor = UIColor.lightGrayColor()
        clickLabel.textColor = UIColor.lightGrayColor()
    }
    
    // 広告が表示された際に呼ばれます
    func imobileSdkAdsSpotDidShow(spotId: String!){
        didShowLabel.textColor = UIColor.blackColor()
    }
    
    // 広告をクリックした際に呼ばれます
    func imobileSdkAdsSpotDidClick(spotId: String!){
        clickLabel.textColor = UIColor.blackColor()
    }
}

