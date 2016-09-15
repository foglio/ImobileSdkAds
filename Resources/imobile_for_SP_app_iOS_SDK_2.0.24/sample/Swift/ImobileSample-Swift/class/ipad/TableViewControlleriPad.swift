//
//  TableViewController_ipad.swift
//  ImobileSample-Swift
//
//  Created by i-mobile on 2015/03/10.
//  Copyright © 2016年 i-mobile. All rights reserved.
//

import UIKit

class TableViewControlleriPad: TableViewControlleriPhone {
    @IBOutlet weak var tadBannerLabel: UILabel!
    @IBOutlet weak var tadBigBannerLabel: UILabel!
    @IBOutlet weak var skyScreiperLabel: UILabel!
    @IBOutlet weak var wideSkyScreiperLabel: UILabel!
    @IBOutlet weak var squareSmallLabel: UILabel!
    @IBOutlet weak var squareLabel: UILabel!
    @IBOutlet weak var rectangleLabel: UILabel!
    @IBOutlet weak var halfPageLabel: UILabel!
    
    @IBOutlet weak var iPadBannerLabel: UILabel!
    @IBOutlet weak var iPadBigBannerLabel: UILabel!
    @IBOutlet weak var iPadMRectangleLabel: UILabel!
    
    @IBOutlet weak var iPadInterLabel: UILabel!
    @IBOutlet weak var iPadTextPopUpLabel: UILabel!
    
    @IBOutlet weak var iPadNativeLabel: UILabel!
    @IBOutlet weak var iPadNativeWideLabel: UILabel!
    @IBOutlet weak var iPadNativeInfeedLabel: UILabel!
    
    @IBOutlet weak var iPadFullScreenInlineLabel: UILabel!
    @IBOutlet weak var iPadFullScreenInterLabel: UILabel!
    
    override func createAdDisplayInfoArray() {
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height;
        let navigationBarHeight = self.navigationController!.navigationBar.frame.size.height;
        
        
        let adDisplayInfos : Dictionary = [
            1: AdDisplayInfo.init(adID: "banner", adTitle: "バナー(320 × 50)",
                pid: ImobileSpotInfo.bannerPid, mid: ImobileSpotInfo.bannerMid, sid: ImobileSpotInfo.bannerSid,
                label: iPadBannerLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(320, 50)),
            
            2: AdDisplayInfo.init(adID: "bigBanner", adTitle: "ビックバナー(320 × 100)",
                pid: ImobileSpotInfo.bigBannerPid, mid: ImobileSpotInfo.bigBannerMid, sid: ImobileSpotInfo.bigBannerSid,
                label: iPadBigBannerLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(320, 100)),
            
            3: AdDisplayInfo.init(adID: "tabBanner", adTitle: "バナー(468 × 60)",
                pid: ImobileSpotInfo.tabBannerPid, mid: ImobileSpotInfo.tabBannerMid, sid: ImobileSpotInfo.tabBannerSid,
                label: tadBannerLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(468, 60)),
            
            4: AdDisplayInfo.init(adID: "tabBigBanner", adTitle: "ビッグバナー(728 × 90)",
                pid: ImobileSpotInfo.tabBigBannerPid, mid: ImobileSpotInfo.tabBigBannerMid, sid: ImobileSpotInfo.tabBigBannerSid,
                label: tadBigBannerLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(728, 90)),
            
            5: AdDisplayInfo.init(adID: "skyScraper", adTitle: "スカイスクレイバー(120 × 600)",
                pid: ImobileSpotInfo.skyScreiperPid, mid: ImobileSpotInfo.skyScreiperMid, sid: ImobileSpotInfo.skyScreiperSid,
                label: skyScreiperLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(120, 600)),
            
            6: AdDisplayInfo.init(adID: "wideSkyScraper", adTitle: "ワイドスカイスクレイバー(160 × 600)",
                pid: ImobileSpotInfo.wideSkyScreiperPid, mid: ImobileSpotInfo.wideSkyScreiperMid, sid: ImobileSpotInfo.wideSkyScreiperSid,
                label: wideSkyScreiperLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(160, 600)),
            
            7: AdDisplayInfo.init(adID: "squareSmall", adTitle: "スクエア(小)(200 × 200)",
                pid: ImobileSpotInfo.smallSquarePid, mid: ImobileSpotInfo.smallSquareMid, sid: ImobileSpotInfo.smallSquareSid,
                label: squareSmallLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(200, 200)),
            
            8: AdDisplayInfo.init(adID: "suqare", adTitle: "スクエア(250 × 250)",
                pid: ImobileSpotInfo.squarePid, mid: ImobileSpotInfo.squareMid, sid: ImobileSpotInfo.squareSid,
                label: squareLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(250, 250)),
            
            9: AdDisplayInfo.init(adID: "mRectangle", adTitle: "ミディアムレクタングル(300 × 250)",
                pid: ImobileSpotInfo.mRectanglePid, mid: ImobileSpotInfo.mRectangleMid, sid: ImobileSpotInfo.mRectangleSid,
                label: iPadMRectangleLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(300, 250)),
            
            10: AdDisplayInfo.init(adID: "rectangle", adTitle: "ビックレクタングル(336 × 280)",
                pid: ImobileSpotInfo.rectanglePid, mid: ImobileSpotInfo.rectangleMid, sid: ImobileSpotInfo.rectangleSid,
                label: rectangleLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(336, 280)),
            
            11: AdDisplayInfo.init(adID: "halfPage", adTitle: "ハーフページ(300 × 600)",
                pid: ImobileSpotInfo.halfPagePid, mid: ImobileSpotInfo.halfPageMid, sid: ImobileSpotInfo.halfPageSid,
                label: halfPageLabel, adDisplayType: AdDisplayType.InLine, size: CGSizeMake(300, 600)),
            
            12: AdDisplayInfo.init(adID: "inter", adTitle: "インタースティシャル",
                pid: ImobileSpotInfo.interPid, mid: ImobileSpotInfo.interMid, sid: ImobileSpotInfo.interSid,
                label: iPadInterLabel, adDisplayType: AdDisplayType.FullScreen),
            
            13: AdDisplayInfo.init(adID: "textPopUp", adTitle: "テキストポップアップ",
                pid: ImobileSpotInfo.textPopUpPid, mid: ImobileSpotInfo.textPopUpMid, sid: ImobileSpotInfo.textPopUpSid,
                label: iPadTextPopUpLabel, adDisplayType: AdDisplayType.FullScreen),
            
            14: AdDisplayInfo.init(adID: "native", adTitle: "ネイティブ",
                pid: ImobileSpotInfo.nativePid, mid: ImobileSpotInfo.nativeMid, sid: ImobileSpotInfo.nativeSid,
                label: iPadNativeLabel, adDisplayType: AdDisplayType.Native),
            
            15: AdDisplayInfo.init(adID: "nativeWide", adTitle: "ネイティブ(ワイド)",
                pid: ImobileSpotInfo.nativeWidePid, mid: ImobileSpotInfo.nativeWideMid, sid: ImobileSpotInfo.nativeWideSid,
                label: iPadNativeWideLabel, adDisplayType: AdDisplayType.Native),
            
            16: AdDisplayInfo.init(adID: "nativeInfeed", adTitle: "ネイティブ(インフィード)",
                pid: ImobileSpotInfo.nativePid, mid: ImobileSpotInfo.nativeMid, sid: ImobileSpotInfo.nativeSid,
                label: iPadNativeInfeedLabel, adDisplayType: AdDisplayType.NativeInfeed),
            
            17: AdDisplayInfo.init(adID: "fullScreenInline", adTitle: "フルスクリーンアド(インライン)",
                pid: ImobileSpotInfo.fullScreenInlinePid, mid: ImobileSpotInfo.fullScreenInlineMid, sid: ImobileSpotInfo.fullScreenInlineSid,
                label: iPadFullScreenInlineLabel, adDisplayType: AdDisplayType.InlineFullScreen,
                size: CGSizeMake(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - statusBarHeight - navigationBarHeight),  adDisplayPosition:CGPointMake(0, statusBarHeight + navigationBarHeight)),
            
            18: AdDisplayInfo.init(adID: "fullScreenInter", adTitle: "フルスクリーンアド(全画面)",
                pid: ImobileSpotInfo.fullScreenInterPid, mid: ImobileSpotInfo.fullScreenInterMid, sid: ImobileSpotInfo.fullScreenInterSid,
                label: iPadFullScreenInterLabel, adDisplayType: AdDisplayType.FullScreen),
            ]
        
        setAdDisplayPositionsForBanners(adDisplayInfos)
        
        self.adDisplayInfos = adDisplayInfos
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cellNum = 0
        
        switch section {
        case 0:
            cellNum = 12
        case 1:
            cellNum = 3
        case 2:
            cellNum = 3
        default:
            cellNum = 0
        }
        
        return cellNum
    }
    
}
