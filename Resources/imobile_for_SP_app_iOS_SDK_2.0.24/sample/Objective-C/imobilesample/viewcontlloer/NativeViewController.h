//
//  NativeViewController.h
//  imobilesample
//
//  Created by i-mobile on 2015/08/28.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdDisplayInfo.h"

#import <ImobileSdkAds/ImobileSdkAds.h>

@interface NativeViewController : UIViewController <IMobileSdkAdsDelegate>

@property (nonatomic) AdDisplayInfo *adDisplayInfo;

@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) IBOutlet UILabel *adTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *adDescriptionLabel;

@end

