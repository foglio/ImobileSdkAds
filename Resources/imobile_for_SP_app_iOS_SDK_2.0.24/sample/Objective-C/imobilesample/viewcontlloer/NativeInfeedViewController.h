//
//  NativeInfeedViewController.h
//  imobilesample
//
//  Created by i-mobile on 2015/10/19.
//  Copyright © 2015年 i-mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ImobileSdkAds/ImobileSdkAds.h>
#import "AdDisplayInfo.h"

@interface NativeInfeedViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,IMobileSdkAdsDelegate>

@property (nonatomic) AdDisplayInfo *adDisplayInfo;

@property (weak, nonatomic) IBOutlet UITableView *adTableView;

@end
