//
//  AdDisplayInfo.swift
//  ImobileSample-Swift
//
//  Created by i-mobile on 2016/06/16.
//  Copyright © 2016年 i-mobile. All rights reserved.
//

import Foundation
import UIKit

enum AdDisplayType{
    case
        InLine,
        InlineFullScreen,
        FullScreen,
        Native,
        NativeInfeed
}

class AdDisplayInfo : NSObject {
    var adID : String!
    var adTitle : String!
    var pid : String!
    var mid : String!
    var sid : String!
    var label : UILabel!
    var adDisplayType : AdDisplayType!
    var adDisplayPosition : CGPoint!
    var size : CGSize!
    
    init(adID: String, adTitle: String,
         pid: String, mid: String, sid: String,
         label: UILabel, adDisplayType: AdDisplayType,
         size: CGSize = CGSizeMake(0, 0),  adDisplayPosition : CGPoint = CGPointZero) {
        self.adID = adID
        self.adTitle = adTitle
        self.pid = pid
        self.mid = mid
        self.sid = sid
        self.label = label
        self.adDisplayType = adDisplayType
        self.adDisplayPosition = adDisplayPosition
        self.size = size
    }
}