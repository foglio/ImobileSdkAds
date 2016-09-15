//
//  NativeViewController.h
//  imobilesample
//
//  Created by i-mobile on 2015/08/28.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import "NativeViewController.h"

#import <ImobileSdkAds/ImobileSdkAds.h>

@implementation NativeViewController

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

    // 広告を表示します
    [ImobileSdkAds getNativeAdData:sid ViewController:self Delegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - i-mobileデリゲードメソッド
- (void)onNativeAdDataReciveCompleted:(NSString *)spotId nativeArray:(NSArray *)nativeArray{
    
    // バナータイプへの表示
    ImobileSdkAdsNativeObject *ads = (ImobileSdkAdsNativeObject *)[nativeArray objectAtIndex:0];
    
    // タイトルの取得
    self.adTitleLabel.text = [ads getAdTitle];
    
    // ディスクリプションの取得
    self.adDescriptionLabel.text = [ads getAdDescription];
    
    //　画像の取得
    [ads getAdImageCompleteHandler:^(UIImage *loadimg) {
        //　画像の取得完了時に呼ばれます。
        self.adImageView.image = loadimg;
    }];
    
    // 該当するUIにクリックイベントの付加をします。
    [ads addClickFunction:self.adImageView];
    [ads addClickFunction:self.adTitleLabel];
    [ads addClickFunction:self.adDescriptionLabel];
}

@end