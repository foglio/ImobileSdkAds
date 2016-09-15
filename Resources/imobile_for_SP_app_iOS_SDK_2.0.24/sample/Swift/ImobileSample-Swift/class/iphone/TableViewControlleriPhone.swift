//
//  TableViewController_iphone.swift
//  ImobileSample-Swift
//
//  Created by i-mobile on 2015/03/09.
//  Copyright © 2016年 i-mobile. All rights reserved.
//

import UIKit

class TableViewControlleriPhone: UITableViewController , UIAlertViewDelegate{
    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var bigBannerLabel: UILabel!
    @IBOutlet weak var mRectangleLabel: UILabel!
    
    @IBOutlet weak var interLabel: UILabel!
    @IBOutlet weak var textPopUpLabel: UILabel!
    
    @IBOutlet weak var nativeLabel: UILabel!
    @IBOutlet weak var nativeWideLabel: UILabel!
    @IBOutlet weak var nativeInfeedLabel: UILabel!
    
    @IBOutlet weak var fullScreenInlineLabel: UILabel!
    @IBOutlet weak var fullScreenInterLabel: UILabel!
    
    var partnerIDTextField :UITextField!
    var mediaIDTextField :UITextField!
    var spotIDTextField :UITextField!
    var adDisplayInfos : Dictionary<Int, AdDisplayInfo> = [:]

// MARK: - Ad and TableView Data
    func createAdDisplayInfoArray() {
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height;
        let navigationBarHeight = self.navigationController!.navigationBar.frame.size.height;
        
        let adDisplayInfos : Dictionary = [
            1: AdDisplayInfo.init(adID: "banner", adTitle: "バナー(320 × 50)",
                pid: ImobileSpotInfo.bannerPid, mid: ImobileSpotInfo.bannerMid, sid: ImobileSpotInfo.bannerSid,
                label: bannerLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(320, 50)),
            
            2: AdDisplayInfo.init(adID: "bigBanner", adTitle: "ビックバナー(320 × 100)",
                pid: ImobileSpotInfo.bigBannerPid, mid: ImobileSpotInfo.bigBannerMid, sid: ImobileSpotInfo.bigBannerSid,
                label: bigBannerLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(320, 100)),
            
            3: AdDisplayInfo.init(adID: "mRectangle", adTitle: "ミディアムレクタングル(300 × 250)",
                pid: ImobileSpotInfo.mRectanglePid, mid: ImobileSpotInfo.mRectangleMid, sid: ImobileSpotInfo.mRectangleSid,
                label: mRectangleLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(300, 250)),
            
            4: AdDisplayInfo.init(adID: "inter", adTitle: "インタースティシャル",
                pid: ImobileSpotInfo.interPid, mid: ImobileSpotInfo.interMid, sid: ImobileSpotInfo.interSid,
                label: interLabel, adDisplayType: AdDisplayType.FullScreen),
            
            5: AdDisplayInfo.init(adID: "textPopUp", adTitle: "テキストポップアップ",
                pid: ImobileSpotInfo.textPopUpPid, mid: ImobileSpotInfo.textPopUpMid, sid: ImobileSpotInfo.textPopUpSid,
                label: textPopUpLabel, adDisplayType: AdDisplayType.FullScreen),
            
            6: AdDisplayInfo.init(adID: "native", adTitle: "ネイティブ",
                pid: ImobileSpotInfo.nativePid, mid: ImobileSpotInfo.nativeMid, sid: ImobileSpotInfo.nativeSid,
                label: nativeLabel, adDisplayType: AdDisplayType.Native),
            
            7: AdDisplayInfo.init(adID: "nativeWide", adTitle: "ネイティブ(ワイド)",
                pid: ImobileSpotInfo.nativeWidePid, mid: ImobileSpotInfo.nativeWideMid, sid: ImobileSpotInfo.nativeWideSid,
                label: nativeWideLabel, adDisplayType: AdDisplayType.Native),
            
            8: AdDisplayInfo.init(adID: "nativeInfeed", adTitle: "ネイティブ(インフィード)",
                pid: ImobileSpotInfo.nativeInfeedPid, mid: ImobileSpotInfo.nativeInfeedMid, sid: ImobileSpotInfo.nativeInfeedSid,
                label: nativeInfeedLabel, adDisplayType: AdDisplayType.NativeInfeed),
            
            9: AdDisplayInfo.init(adID: "fullScreenInline", adTitle: "フルスクリーンアド(インライン)",
                pid: ImobileSpotInfo.fullScreenInlinePid, mid: ImobileSpotInfo.fullScreenInlineMid, sid: ImobileSpotInfo.fullScreenInlineSid,
                label: fullScreenInlineLabel, adDisplayType: AdDisplayType.InlineFullScreen,
                size: CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - statusBarHeight - navigationBarHeight),
                adDisplayPosition: CGPointMake(0, statusBarHeight + navigationBarHeight)),
            
            10: AdDisplayInfo.init(adID: "fullScreenInter", adTitle: "フルスクリーンアド(全画面)",
                pid: ImobileSpotInfo.fullScreenInterPid, mid: ImobileSpotInfo.fullScreenInterMid, sid: ImobileSpotInfo.fullScreenInterSid,
                label: fullScreenInterLabel, adDisplayType: AdDisplayType.FullScreen),
            ]
        
        setAdDisplayPositionsForBanners(adDisplayInfos)
        
        self.adDisplayInfos = adDisplayInfos
    }
    
    func setAdDisplayPositionsForBanners(adDisplayInfos: Dictionary<Int, AdDisplayInfo>){
        
        for key in adDisplayInfos.keys {
            
            let adDisplayInfo : AdDisplayInfo! = adDisplayInfos[key]
            
            if adDisplayInfo.adDisplayType == AdDisplayType.InLine {
                let posX = (UIScreen.mainScreen().bounds.width - adDisplayInfo.size.width) / 2
                let posY = (UIScreen.mainScreen().bounds.height - adDisplayInfo.size.height) / 2
                adDisplayInfo.adDisplayPosition = CGPointMake(posX, posY)
            }
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cellNum = 0
        
        switch section {
        case 0:
            cellNum = 4
        case 1:
            cellNum = 3
        case 2:
            cellNum = 3
        default:
            cellNum = 0
        }
        
        return cellNum
    }
    
    //MARK: - Implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAdDisplayInfoArray()
        
        for i in 1...adDisplayInfos.count{
            resetId(i)
        }
    }
    
    func resetId (type: Int) {
        adDisplayInfos[type]!.label?.text = "PID:" + checkId(adDisplayInfos[type]!.adID!, key: "_pid") + " MID:" + checkId(adDisplayInfos[type]!.adID!, key: "_mid")+" SID:"+checkId(adDisplayInfos[type]!.adID!, key: "_sid")
    }
    
    func checkId(adId: String!, key: String!, defaultString: String! = "未設定") -> String{
        let userDefaults  = NSUserDefaults.standardUserDefaults()
        let id = userDefaults.stringForKey(adId + key)
        if(id == nil || id!.characters.count == 0){
            return defaultString
        }
        return id!
    }
    
    
    @IBAction func touchSettingBtn(sender: UIButton) {
        
        let adDisplayInfo : AdDisplayInfo = adDisplayInfos[sender.tag]!
        let userDefaults  = NSUserDefaults.standardUserDefaults()
        let pid : String! = userDefaults.stringForKey(adDisplayInfo.adID! + "_pid")
        let mid : String! = userDefaults.stringForKey(adDisplayInfo.adID! + "_mid")
        let sid : String! = userDefaults.stringForKey(adDisplayInfo.adID! + "_sid")
        
        let alertView = UIAlertView(title: "パラメータを入力してください",
                                    message:adDisplayInfo.adTitle!,
                                    delegate: self,
                                    cancelButtonTitle: "Cancel",
                                    otherButtonTitles: "OK")
        alertView.tag = sender.tag
        
        let space:UIView = UIView(frame:CGRectMake(0, 0, 270, 120))
        alertView.setValue(space, forKey: "accessoryView")
        
        let partnerLabel = createSettingsDescriptionLabel("PID", position: 5)
        let mediaLabel = createSettingsDescriptionLabel("MID", position: 40)
        let spotLabel = createSettingsDescriptionLabel("SID", position: 80)
        
        partnerIDTextField = createSettingsTextField(pid, position: 5)
        mediaIDTextField = createSettingsTextField(mid, position: 40)
        spotIDTextField = createSettingsTextField(sid, position: 80)
        
        space.addSubview(partnerLabel)
        space.addSubview(mediaLabel)
        space.addSubview(spotLabel)
        space.addSubview(partnerIDTextField)
        space.addSubview(mediaIDTextField)
        space.addSubview(spotIDTextField)
        
        alertView.show()
    }
    
    func createSettingsDescriptionLabel(name: String, position: CGFloat) -> UILabel{
        let label = UILabel(frame: CGRectMake(10 , position, 100, 30))
        label.text = name
        return label
    }
    
    func createSettingsTextField(id: String?, position:CGFloat) -> UITextField{
        let idTextField = UITextField(frame: CGRectMake(120 , position, 130, 30))
        idTextField.textAlignment = .Right
        idTextField.keyboardType = UIKeyboardType.DecimalPad
        idTextField.layer.borderWidth = 1.0
        idTextField.placeholder = "未設定"
        if id != nil && id!.characters.count != 0 {
                idTextField.text = id
        }
        return idTextField
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex != alertView.cancelButtonIndex) {
            let adID : String! = adDisplayInfos[alertView.tag]!.adID
            let userDefaults  = NSUserDefaults.standardUserDefaults()
            
            userDefaults.setObject(partnerIDTextField.text, forKey: adID + "_pid")
            userDefaults.synchronize()
            userDefaults.setObject(mediaIDTextField.text, forKey: adID + "_mid")
            userDefaults.synchronize()
            userDefaults.setObject(spotIDTextField.text, forKey: adID + "_sid")
            userDefaults.synchronize()
            
            resetId(alertView.tag)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let adDisplayInfo : AdDisplayInfo! = adDisplayInfos[Int(segue.identifier!)!]
        let adId : String! = adDisplayInfo.adID
        let title : String! = adDisplayInfo.adTitle
        
        adDisplayInfo.pid = checkId(adId, key: "_pid", defaultString: adDisplayInfo.pid)
        adDisplayInfo.mid = checkId(adId, key: "_mid", defaultString: adDisplayInfo.mid)
        adDisplayInfo.sid = checkId(adId, key: "_sid", defaultString: adDisplayInfo.sid)
        
        // バナー
        if (adDisplayInfo.adDisplayType == AdDisplayType.InLine){
            let nextViewController: InlineViewController = segue.destinationViewController as! InlineViewController
            nextViewController.title = title
            nextViewController.adDisplayInfo = adDisplayInfo
        }
        // フルスクリーンアド(インライン)
        else if (adDisplayInfo.adDisplayType == AdDisplayType.InlineFullScreen){
            let nextViewController: InlineFullScreenAdViewController = segue.destinationViewController as! InlineFullScreenAdViewController
            nextViewController.title = title
            nextViewController.adDisplayInfo = adDisplayInfo
        }
        // 全画面
        else if(adDisplayInfo.adDisplayType == AdDisplayType.FullScreen){
            let nextViewController: FullScreenViewController = segue.destinationViewController as! FullScreenViewController
            nextViewController.title = title
            nextViewController.adDisplayInfo = adDisplayInfo
        }
        // 以下ネイティブ
        else if(adDisplayInfo.adDisplayType == AdDisplayType.Native){
            let nextViewController: NativeViewController = segue.destinationViewController as! NativeViewController
            nextViewController.title = title
            nextViewController.adDisplayInfo = adDisplayInfo
        }
        else if(adDisplayInfo.adDisplayType == AdDisplayType.NativeInfeed){
            let nextViewController: NativeInfeedViewController = segue.destinationViewController as! NativeInfeedViewController
            nextViewController.title = title
            nextViewController.adDisplayInfo = adDisplayInfo
        }
    }
    
}