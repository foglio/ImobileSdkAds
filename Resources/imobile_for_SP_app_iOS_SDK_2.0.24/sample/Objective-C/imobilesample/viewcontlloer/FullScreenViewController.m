//
//  FullScreenViewController.m
//  imobilesample
//
//  Created by i-mobile on 2015/07/08.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import "FullScreenViewController.h"

#import <ImobileSdkAds/ImobileSdkAds.h>

@interface FullScreenViewController()
@property (nonatomic) NSString *sid;

@end

@implementation FullScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *pid = self.adDisplayInfo.pid;
    NSString *mid = self.adDisplayInfo.mid;
    self.sid = self.adDisplayInfo.sid;
    
    // スポット情報を設定します
    [ImobileSdkAds registerWithPublisherID:pid MediaID:mid SpotID:self.sid];
    
    // デリゲートの登録をします
    [ImobileSdkAds setSpotDelegate:self.sid delegate:self];
    
    // 広告の取得を開始します
    [ImobileSdkAds startBySpotID:self.sid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// 広告の表示を行います
- (IBAction)showAd:(UIButton *)sender {
    [ImobileSdkAds showBySpotID:self.sid];
}

// 広告の表示準備が完了した際に呼ばれます
- (void)imobileSdkAdsSpot:(NSString *)spotid didReadyWithValue:(ImobileSdkAdsReadyResult)value{
    self.readyLabel.textColor = [UIColor blackColor];
    self.didShowLabel.textColor = [UIColor lightGrayColor];
    self.clickLabel.textColor = [UIColor lightGrayColor];
    self.closeLabel.textColor = [UIColor lightGrayColor];
}

// 広告の表示が完了した際に呼ばれます
- (void)imobileSdkAdsSpotDidShow:(NSString *)spotid{
    self.didShowLabel.textColor = [UIColor blackColor];
}

// 広告をクリックした際に呼ばれます
- (void)imobileSdkAdsSpotDidClick:(NSString *)spotid{
    self.clickLabel.textColor = [UIColor blackColor];
}

// 広告が閉じられた際に呼ばれます
// 表示頻度設定している場合、表示処理がスキップされた際にも呼ばれます。
- (void)imobileSdkAdsSpotDidClose:(NSString *)spotid{
    self.closeLabel.textColor = [UIColor blackColor];
    self.readyLabel.textColor = [UIColor lightGrayColor];
}

@end