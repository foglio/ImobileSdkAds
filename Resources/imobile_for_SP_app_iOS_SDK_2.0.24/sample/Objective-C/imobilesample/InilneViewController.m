//
//  InileViewController.m
//  imobilesample
//
//  Created by i-mobile on 2015/07/08.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import "InlineViewController.h"

@interface InlineViewController ()
@property (nonatomic) UIView *imobileAdView;
@end

@implementation InlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *pid = self.adDisplayInfo.pid;
    NSString *mid = self.adDisplayInfo.mid;
    NSString *sid = self.adDisplayInfo.sid;
    
    // スポット情報を設定します
    [ImobileSdkAds registerWithPublisherID:pid MediaID:mid SpotID:sid];
    
    // デリゲートの登録をします
    [ImobileSdkAds setSpotDelegate:sid delegate:self];
    
    // 広告の取得を開始します
    [ImobileSdkAds startBySpotID:sid];
    
    // 広告の表示位置
    CGPoint imobileAdPos = self.adDisplayInfo.adDisplayPosition;
    // 表示する広告のサイズ
    CGSize imobileAdSize = self.adDisplayInfo.size;
    
    // 広告を表示するViewを作成します
    self.imobileAdView = [[UIView alloc] initWithFrame:CGRectMake(imobileAdPos.x, imobileAdPos.y,
                                                                  imobileAdSize.width, imobileAdSize.height)];
    //広告を表示するViewをViewControllerに追加します
    [self.view addSubview:self.imobileAdView];
    // 広告を表示します。
    [ImobileSdkAds showBySpotID:sid View:self.imobileAdView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 広告の表示準備が完了した際に呼ばれます
- (void)imobileSdkAdsSpot:(NSString *)spotid didReadyWithValue:(ImobileSdkAdsReadyResult)value{
    self.readyLabel.textColor = [UIColor blackColor];
    self.didShowLabel.textColor = [UIColor lightGrayColor];
    self.clickLabel.textColor = [UIColor lightGrayColor];
}

// 広告の表示が完了した際に呼ばれます
- (void)imobileSdkAdsSpotDidShow:(NSString *)spotid{
    self.didShowLabel.textColor = [UIColor blackColor];
}

// 広告をクリックした際に呼ばれます
- (void)imobileSdkAdsSpotDidClick:(NSString *)spotid{
    self.clickLabel.textColor = [UIColor blackColor];
}

- (void)imobileSdkAdsSpot:(NSString *)spotid didFailWithValue:(ImobileSdkAdsFailResult)value{
    NSString *msg;
    switch (value) {
        case IMOBILESDKADS_ERROR_PARAM:
            msg = @"IMOBILESDKADS_ERROR_PARAM";
            break;
        case IMOBILESDKADS_ERROR_AUTHORITY:
            msg = @"IMOBILESDKADS_ERROR_AUTHORITY";
            break;
        case IMOBILESDKADS_ERROR_RESPONSE:
            msg = @"IMOBILESDKADS_ERROR_RESPONSE";
            break;
        case IMOBILESDKADS_ERROR_NETWORK_NOT_READY:
            msg = @"IMOBILESDKADS_ERROR_NETWORK_NOT_READY";
            break;
        case IMOBILESDKADS_ERROR_NETWORK:
            msg = @"IMOBILESDKADS_ERROR_NETWORK";
            break;
        case IMOBILESDKADS_ERROR_UNKNOWN:
            msg = @"IMOBILESDKADS_ERROR_UNKNOWN";
            break;
        case IMOBILESDKADS_ERROR_AD_NOT_READY:
            msg = @"IMOBILESDKADS_ERROR_AD_NOT_READY";
            break;
        case IMOBILESDKADS_ERROR_NOT_FOUND:
            msg = @"IMOBILESDKADS_ERROR_NOT_FOUND";
            break;
        case IMOBILESDKADS_ERROR_SHOW_TIMEOUT:
            msg = @"IMOBILESDKADS_ERROR_SHOW_TIMEOUT";
            break;
        default:
            break;
    }
    // １行で書くタイプ（１ボタンタイプ）
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"error" message:msg
                              delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
    [alert show];
}


@end
