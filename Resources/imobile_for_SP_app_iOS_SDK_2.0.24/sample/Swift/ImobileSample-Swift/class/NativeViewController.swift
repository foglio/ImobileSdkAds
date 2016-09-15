//
//  NativeViewController.swift
//  ImobileSample-Swift
//
//  Created by i-mobile on 2015/11/26.
//  Copyright © 2016年 i-mobile. All rights reserved.
//
import UIKit

class NativeViewController: UIViewController,IMobileSdkAdsDelegate {
    
    var adDisplayInfo : AdDisplayInfo!
    
    // 広告の表示を行うUI
    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var adTitleLabel: UILabel!
    @IBOutlet weak var adDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pid : String = adDisplayInfo.pid!
        let mid : String = adDisplayInfo.mid!
        let sid : String = adDisplayInfo.sid!
        
        // スポット情報を設定します
        ImobileSdkAds.registerWithPublisherID(pid, mediaID:mid, spotID:sid)
        // 広告の取得を開始します
        ImobileSdkAds.startBySpotID(sid)
        // 広告を表示します
        ImobileSdkAds.getNativeAdData(sid, viewController: self, delegate: self)
    }
    
    // ネイティブ広告の準備が完了した際に呼ばれます
    func onNativeAdDataReciveCompleted(spotId: String!, nativeArray: [AnyObject]!) {
        // 広告リストから広告の抽出
        let adObj = nativeArray[0] as! ImobileSdkAdsNativeObject
        
        // タイトルの設定
        adTitleLabel.text = adObj.getAdTitle()
        
        // ディスクリプションの設定
        adDescriptionLabel.text = adObj.getAdDescription()
        
        // 画像の読み込み
        adObj.getAdImageCompleteHandler({ (loadImg : UIImage!) -> Void in
            // 画像の読み込み完了時に実行されます
            
            // 画像の設定
            self.adImageView.image = loadImg
        })
        
        // クリックイベントの埋め込み
        adObj.addClickFunction(adTitleLabel)
        adObj.addClickFunction(adDescriptionLabel)
        adObj.addClickFunction(adImageView)
    }
}