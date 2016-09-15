//
//  InlineFullScreenAdViewController.h
//  imobilesample
//
//  Created by tsuchiyahiroki on 2016/06/22.
//  Copyright © 2016年 i-mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdDisplayInfo.h"
#import <ImobileSdkAds/ImobileSdkAds.h>

@interface InlineFullScreenAdViewController : UIViewController <IMobileSdkAdsDelegate>

@property (nonatomic) AdDisplayInfo *adDisplayInfo;

//イベントの管理用
@property (weak, nonatomic) IBOutlet UILabel *readyLabel;
@property (weak, nonatomic) IBOutlet UILabel *didShowLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickLabel;

@end
