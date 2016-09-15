//
//  TableViewController_ipad.m
//  imobilesample
//
//  Created by i-mobile on 2015/02/19.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//


#import "TableViewController_ipad.h"

//アイモバイルSDKの読み込み
#import <ImobileSdkAds/ImobileSdkAds.h>

//定数の読み込み
#import "Imobile_spot_info.h"

//値受け渡し用
#import "InlineViewController.h"
#import "FullScreenViewController.h"
#import "NativeViewController.h"
#import "NativeInfeedViewController.h"
#import "InlineFullScreenAdViewController.h"

// 広告管理用のクラス
#import "AdDisplayInfo.h"

@interface TableViewController_ipad (){
    UITextField *partner_text;
    UITextField *media_text;
    UITextField *spot_text;
}
//設定ラベル
@property (weak, nonatomic) IBOutlet UILabel *label_320_50_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_320_100_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_468_90_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_728_90_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_120_600_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_160_600_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_200_200_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_250_250_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_300_250_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_336_280_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_300_600_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_inter_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_popup_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_Native_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_NativeWide_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_NativeInfeed_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_FullScreen_inLine;
@property (weak, nonatomic) IBOutlet UILabel *label_FullScreen_fullScreen;

//設定ボタン
@property (weak, nonatomic) IBOutlet UIButton *button_320_50_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_320_100_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_468_90_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_728_90_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_120_600_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_160_600_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_200_200_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_250_250_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_300_250_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_336_280_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_300_600_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_inter_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_popup_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_Native_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_NativeWide_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_NativeInfeed_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_FullScreen_Inline;
@property (weak, nonatomic) IBOutlet UIButton *button_FullScreen_fullScreen;

@property (nonatomic) NSDictionary *adDisplayInfos;

@end

@implementation TableViewController_ipad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createAdDisplayInfoDictionary];
    
    for (int i = 1; i <= [self.adDisplayInfos count]; i++) {
        [self keyreset:i];
    }
    
    if ([[[UIDevice currentDevice] systemVersion] intValue] <= 6) {
        
        for (id key in [self.adDisplayInfos keyEnumerator]){
            AdDisplayInfo *adDisplayInfo = self.adDisplayInfos[key];
            [adDisplayInfo.button removeFromSuperview];
            [adDisplayInfo.label removeFromSuperview];
        }
    }
}

-(void) createAdDisplayInfoDictionary {
    
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    
    NSDictionary *adDisplayInfos = @{
                                     @1 : [[AdDisplayInfo alloc] initWithKey:@"320_50_iphone"          Title:@"320 × 50  バナー"   AdDisplayType:InLine
                                                                        Label: self.label_320_50_ipad   Button:self.button_320_50_ipad
                                                                          pid: banner_320_50_pid    mid:banner_320_50_mid   sid:banner_320_50_sid
                                                                       CGSize:CGSizeMake(320, 50) AdDisplayPosition:CGPointZero],
                                      
                                      @2 : [[AdDisplayInfo alloc] initWithKey:@"320_100_iphone"         Title:@"320 × 100 ビックバナー"   AdDisplayType:InLine
                                                                        Label: self.label_320_100_ipad   Button:self.button_320_100_ipad
                                                                          pid: banner_320_100_pid    mid:banner_320_100_mid   sid:banner_320_100_sid
                                                                       CGSize:CGSizeMake(320, 100) AdDisplayPosition:CGPointZero],
                                      
                                      @3 : [[AdDisplayInfo alloc] initWithKey:@"468_60_ipad"            Title:@"468 × 60 バナー"   AdDisplayType:InLine
                                                                        Label: self.label_468_90_ipad   Button:self.button_468_90_ipad
                                                                          pid: banner_468_60_pid    mid:banner_468_60_mid   sid:banner_468_60_sid
                                                                       CGSize:CGSizeMake(468, 60) AdDisplayPosition:CGPointZero],
                                      
                                      @4 : [[AdDisplayInfo alloc] initWithKey:@"728_90_ipad"            Title:@"728 × 90 ビックバナー"    AdDisplayType:InLine
                                                                        Label: self.label_728_90_ipad   Button:self.button_728_90_ipad
                                                                          pid: banner_728_90_pid    mid:banner_728_90_mid   sid:banner_728_90_sid
                                                                       CGSize:CGSizeMake(728, 90) AdDisplayPosition:CGPointZero],
                                      
                                      @5 : [[AdDisplayInfo alloc] initWithKey:@"120_600_ipad"           Title:@"120 × 600 スカイスクレイバー"    AdDisplayType:InLine
                                                                        Label: self.label_320_50_ipad   Button:self.button_320_50_ipad
                                                                          pid: banner_120_600_pid    mid:banner_120_600_mid   sid:banner_120_600_sid
                                                                       CGSize:CGSizeMake(120, 600) AdDisplayPosition:CGPointZero],
                                      
                                      @6 : [[AdDisplayInfo alloc] initWithKey:@"160_600_ipad"           Title:@"160 × 600 ワイドスカイスクレイバー" AdDisplayType:InLine
                                                                        Label: self.label_160_600_ipad   Button:self.button_160_600_ipad
                                                                          pid: banner_160_600_pid    mid:banner_160_600_mid   sid:banner_160_600_sid
                                                                       CGSize:CGSizeMake(160, 600) AdDisplayPosition:CGPointZero],
                                      
                                      @7 : [[AdDisplayInfo alloc] initWithKey:@"200_200_ipad"           Title:@"200 × 200 スクエア（小）"  AdDisplayType:InLine
                                                                        Label: self.label_200_200_ipad   Button:self.button_200_200_ipad
                                                                          pid: banner_200_200_pid    mid:banner_200_200_mid   sid:banner_200_200_sid
                                                                       CGSize:CGSizeMake(200, 200) AdDisplayPosition:CGPointZero],
                                      
                                      @8 : [[AdDisplayInfo alloc] initWithKey:@"250_250_ipad"           Title:@"250 × 250 スクエア" AdDisplayType:InLine
                                                                        Label: self.label_250_250_ipad   Button:self.button_250_250_ipad
                                                                          pid: banner_250_250_pid    mid:banner_250_250_mid   sid:banner_250_250_sid
                                                                       CGSize:CGSizeMake(250, 250) AdDisplayPosition:CGPointZero],
                                     
                                      @9 : [[AdDisplayInfo alloc] initWithKey:@"300_250_iphone"         Title:@"300 × 250 ミディアムレクタングル"  AdDisplayType:InLine
                                                                        Label: self.label_300_250_ipad   Button:self.button_300_250_ipad
                                                                          pid: banner_250_250_pid    mid:banner_200_200_mid   sid:banner_200_200_sid
                                                                       CGSize:CGSizeMake(300, 250) AdDisplayPosition:CGPointZero],
                                      
                                     @10 : [[AdDisplayInfo alloc] initWithKey:@"336_280_ipad"           Title:@"336 × 280 ビックレクタングル"    AdDisplayType:InLine
                                                                        Label: self.label_336_280_ipad   Button:self.button_336_280_ipad
                                                                          pid: banner_336_280_pid    mid:banner_336_280_mid   sid:banner_336_280_sid
                                                                       CGSize:CGSizeMake(336, 280) AdDisplayPosition:CGPointZero],
                                      
                                     @11 : [[AdDisplayInfo alloc] initWithKey:@"300_600_ipad"           Title:@"300 × 600 ハーフページ"   AdDisplayType:InLine
                                                                        Label: self.label_300_600_ipad   Button:self.button_300_600_ipad
                                                                          pid: banner_300_600_pid    mid:banner_300_600_mid   sid:banner_300_600_sid
                                                                       CGSize:CGSizeMake(300, 600) AdDisplayPosition:CGPointZero],
                                      
                                     @12 : [[AdDisplayInfo alloc] initWithKey:@"inter_iphone"           Title:@"インタースティシャル"     AdDisplayType:FullScreen
                                                                        Label: self.label_inter_ipad   Button:self.button_inter_ipad
                                                                          pid: inter_pid    mid:inter_mid   sid:inter_sid],
                                      
                                     @13 : [[AdDisplayInfo alloc] initWithKey:@"textpop_iphone"         Title:@"テキストポップアップ"    AdDisplayType:FullScreen
                                                                        Label: self.label_popup_ipad   Button:self.button_popup_ipad
                                                                          pid: textpopup_pid    mid:textpopup_mid   sid:textpopup_sid],
                                      
                                     @14 : [[AdDisplayInfo alloc] initWithKey:@"native_iphone"          Title:@"ネイティブ"      AdDisplayType:Native
                                                                        Label: self.label_Native_ipad   Button:self.button_Native_ipad
                                                                          pid: native_small_pid    mid:native_small_mid   sid:native_small_sid],
                                      
                                     @15 : [[AdDisplayInfo alloc] initWithKey:@"nativewide_iphone"      Title:@"ネイティブ(ワイド)"     AdDisplayType:Native
                                                                        Label: self.label_NativeWide_ipad   Button:self.button_NativeWide_ipad
                                                                          pid: native_big_pid    mid:native_big_mid   sid:native_big_sid],
                                      
                                     @16 : [[AdDisplayInfo alloc] initWithKey:@"nativeinfeed_iphone"    Title:@"ネイティブ(インフィード)"      AdDisplayType:NativeInfeed
                                                                        Label: self.label_NativeInfeed_ipad Button:self.button_NativeInfeed_ipad
                                                                          pid: native_infeed_pid    mid:native_infeed_mid   sid:native_infeed_sid],
                                     
                                     @17 : [[AdDisplayInfo alloc] initWithKey:@"fullScreen_inline"    Title:@"フルスクリーン(インライン)"       AdDisplayType:InLineFullScreen
                                                                        Label: self.label_FullScreen_inLine Button:self.button_FullScreen_Inline
                                                                          pid: fullscreen_inline_pid    mid:fullscreen_inline_mid   sid:fullscreen_inline_sid
                                                                       CGSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen]bounds].size.height - statusHeight - navigationBarHeight)
                                            AdDisplayPosition:CGPointMake(0, statusHeight + navigationBarHeight)],
                                     
                                     @18 : [[AdDisplayInfo alloc] initWithKey:@"fullScreen_fullScreen"    Title:@"フルスクリーン(全画面)"         AdDisplayType:FullScreen
                                                                         Label: self.label_FullScreen_fullScreen Button:self.button_FullScreen_fullScreen
                                                                           pid: fullscreen_inter_pid    mid:fullscreen_inter_mid   sid:fullscreen_inter_sid]
                                     };
    [self setAdDisplayPositionsForBanners:adDisplayInfos];
    self.adDisplayInfos = adDisplayInfos;
}

-(void) setAdDisplayPositionsForBanners:(NSDictionary *) adDisplayInfos{
    for(NSString *key in [adDisplayInfos allKeys]){
        AdDisplayInfo *adDisplayInfo = adDisplayInfos[key];
        if(adDisplayInfo.adDisplayType == InLine){
            float posX = ([[UIScreen mainScreen] bounds].size.width - adDisplayInfo.size.width) / 2;
            float posY = ([[UIScreen mainScreen] bounds].size.height - adDisplayInfo.size.height) / 2;
            adDisplayInfo.adDisplayPosition = CGPointMake(posX, posY);
        }
    }
}

- (void)keyreset:(int)type{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *adID = [[NSString alloc] init];
    NSString *pid = [[NSString alloc] init];
    NSString *mid = [[NSString alloc] init];
    NSString *sid = [[NSString alloc] init];
    
    AdDisplayInfo *description = [self.adDisplayInfos objectForKey:[NSNumber numberWithInt:type]];
    adID = description.adID;
    
    pid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_pid",adID]];
    mid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_mid",adID]];
    sid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_sid",adID]];
    if (!pid || [pid length] == 0) pid = @"未設定";
    if (!mid || [mid length] == 0) mid = @"未設定";
    if (!sid || [sid length] == 0) sid = @"未設定";
    
    description.label.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
}

- (IBAction)setting:(UIButton *)sender {
    [self adkey_load:(int)sender.tag];
}

- (void)adkey_load:(int)type{
    AdDisplayInfo *adDisplayInfo = [self.adDisplayInfos objectForKey:[NSNumber numberWithInt:type]];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *title = adDisplayInfo.adTitle;
    NSString *pid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_pid",adDisplayInfo.adID]];
    NSString *mid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_mid",adDisplayInfo.adID]];
    NSString *sid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_sid",adDisplayInfo.adID]];
    
    UIAlertView *_adinput =  [[UIAlertView alloc] initWithTitle:@"パラメータを入力してください"
                                                        message:title
                                                       delegate:self
                                              cancelButtonTitle:@"キャンセル"
                                              otherButtonTitles:@"OK", nil];
    _adinput.delegate = self;
    _adinput.tag = type;
    _adinput.alertViewStyle = UIAlertViewStyleDefault;
    UIView *space = [[UIView alloc] init];
    space.frame = CGRectMake(0, 0, 270, 120);
    [_adinput setValue:space forKey:@"accessoryView"];
    
    UILabel * partner_label = [self createSettingsDescriptionLabel:@"PID" withYPosition:5];
    UILabel * media_label = [self createSettingsDescriptionLabel:@"MID" withYPosition:40];
    UILabel * spot_label = [self createSettingsDescriptionLabel:@"SID" withYPosition:80];
    
    partner_text = [self createSettingsInputTextFieldWithID:pid withYPosition:5];
    media_text = [self createSettingsInputTextFieldWithID:mid withYPosition:40];
    spot_text = [self createSettingsInputTextFieldWithID:sid withYPosition:80];
    
    [space addSubview:partner_label];
    [space addSubview:media_label];
    [space addSubview:spot_label];
    [space addSubview:partner_text];
    [space addSubview:media_text];
    [space addSubview:spot_text];
    
    [_adinput show];
}

- (UILabel *) createSettingsDescriptionLabel:(NSString *)name withYPosition:(NSInteger)yPos{
    UILabel* label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, yPos, 100, 30);
    label.text = name;
    return label;
}

- (UITextField *) createSettingsInputTextFieldWithID:(NSString *)adID withYPosition:(NSInteger) yPos{
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(120, yPos, 130, 30);
    textField.textAlignment = NSTextAlignmentRight;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    [textField.layer setBorderWidth:0.5];
    textField.placeholder = @"未設定";
    if([adID length] > 0){
        textField.text = adID;
    }
    
    return textField;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != alertView.cancelButtonIndex) {
        AdDisplayInfo *adDisplayInfo = [self.adDisplayInfos objectForKey:@(alertView.tag)];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:partner_text.text forKey:[NSString stringWithFormat:@"%@_pid",adDisplayInfo.adID]];
        [userDefaults synchronize];
        [userDefaults setObject:media_text.text forKey:[NSString stringWithFormat:@"%@_mid",adDisplayInfo.adID]];
        [userDefaults synchronize];
        [userDefaults setObject:spot_text.text forKey:[NSString stringWithFormat:@"%@_sid",adDisplayInfo.adID]];
        [userDefaults synchronize];
        [self keyreset:(int)alertView.tag];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AdDisplayInfo *adDisplayInfo = [self.adDisplayInfos objectForKey:[NSNumber numberWithInt:[segue.identifier intValue]]];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *title = adDisplayInfo.adTitle;
    
    NSString *pid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_pid",adDisplayInfo.adID]];
    NSString *mid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_mid",adDisplayInfo.adID]];
    NSString *sid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_sid",adDisplayInfo.adID]];
    
    if ( pid && (![pid  isEqual: @""] || pid.length > 0)) adDisplayInfo.pid = pid;
    if ( mid && (![mid  isEqual: @""] || mid.length > 0)) adDisplayInfo.mid = mid;
    if ( sid && (![sid  isEqual: @""] || sid.length > 0)) adDisplayInfo.sid = sid;
    
    if (adDisplayInfo.adDisplayType == InLine) {
        //インライン広告
        InlineViewController *vc = segue.destinationViewController;
        vc.title = title;
        vc.adDisplayInfo = adDisplayInfo;
    }
    else if (adDisplayInfo.adDisplayType == InLineFullScreen) {
        //インライン広告
        InlineFullScreenAdViewController *vc = segue.destinationViewController;
        vc.title = title;
        vc.adDisplayInfo = adDisplayInfo;
    }
    else if (adDisplayInfo.adDisplayType == FullScreen){
        FullScreenViewController *vc = segue.destinationViewController;
        vc.title = title;
        vc.adDisplayInfo = adDisplayInfo;
    }else if(adDisplayInfo.adDisplayType == Native){
        NativeViewController *vc = segue.destinationViewController;
        vc.title = title;
        vc.adDisplayInfo = adDisplayInfo;
    }else if(adDisplayInfo.adDisplayType == NativeInfeed){
        NativeInfeedViewController *vc = segue.destinationViewController;
        vc.title = title;
        vc.adDisplayInfo = adDisplayInfo;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

@end
