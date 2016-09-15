//
//  FullScreenViewController.h
//  imobilesample
//
//  Created by i-mobile on 2015/07/08.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ImobileSdkAds/ImobileSdkAds.h>
#import "AdDisplayInfo.h"

@interface FullScreenViewController : UIViewController<IMobileSdkAdsDelegate>

//パラメータ渡し用
@property (nonatomic) AdDisplayInfo *adDisplayInfo;

//イベントの管理用
@property (weak, nonatomic) IBOutlet UILabel *readyLabel;
@property (weak, nonatomic) IBOutlet UILabel *didShowLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickLabel;
@property (weak, nonatomic) IBOutlet UILabel *closeLabel;

@end
