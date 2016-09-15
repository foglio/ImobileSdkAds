//
//  TableViewController.m
//  imobilesample
//
//  Created by i-mobile on 2015/02/19.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import "TableViewController.h"
//アイモバイルSDKの読み込み
#import <ImobileSdkAds/ImobileSdkAds.h>
//定数の読み込み
#import "Imobile_spot_info.h"
// 広告管理用のクラス
#import "AdDisplayInfo.h"

//値受け渡し用
#import "InlineViewController.h"
#import "FullScreenViewController.h"
#import "NativeViewController.h"
#import "NativeInfeedViewController.h"
#import "InlineFullScreenAdViewController.h"

@interface TableViewController (){
    UITextField *partner_text;
    UITextField *media_text;
    UITextField *ad_text;
}

//設定ラベル
@property (weak, nonatomic) IBOutlet UILabel *label_320_50_iphone;
@property (weak, nonatomic) IBOutlet UILabel *label_320_100_iphone;
@property (weak, nonatomic) IBOutlet UILabel *lable_300_250_iphone;
@property (weak, nonatomic) IBOutlet UILabel *label_inter;
@property (weak, nonatomic) IBOutlet UILabel *label_textpopup;
@property (weak, nonatomic) IBOutlet UILabel *label_SmallNative;
@property (weak, nonatomic) IBOutlet UILabel *label_BigNative;
@property (weak, nonatomic) IBOutlet UILabel *label_InfeedNative;
@property (weak, nonatomic) IBOutlet UILabel *label_FullScreenInline;
@property (weak, nonatomic) IBOutlet UILabel *label_FullScreenInter;

//設定ボタン
@property (weak, nonatomic) IBOutlet UIButton *button_320_50_iphone;
@property (weak, nonatomic) IBOutlet UIButton *button_320_100_iphone;
@property (weak, nonatomic) IBOutlet UIButton *button_300_250_iphone;
@property (weak, nonatomic) IBOutlet UIButton *button_inter;
@property (weak, nonatomic) IBOutlet UIButton *button_textpopup;
@property (weak, nonatomic) IBOutlet UIButton *button_SmallNative;
@property (weak, nonatomic) IBOutlet UIButton *button_BigNative;
@property (weak, nonatomic) IBOutlet UIButton *button_InfeedNative;
@property (weak, nonatomic) IBOutlet UIButton *button_FullScreenInline;
@property (weak, nonatomic) IBOutlet UIButton *button_FullScreenInter;

@property (nonatomic) NSDictionary* adDisplayInfos;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createAdDisplayInfoArray];
    
    for (int i = 1; i <= [self.adDisplayInfos count]; i++) {
        [self resetId:i];
    }
    
    if ([[[UIDevice currentDevice] systemVersion] intValue] <= 6) {
        for(id key in [self.adDisplayInfos keyEnumerator]){
            AdDisplayInfo *adDisplayInfo = self.adDisplayInfos[key];
            [adDisplayInfo.label removeFromSuperview];
            [adDisplayInfo.button removeFromSuperview];
        }
    }
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView  class], nil] setFont:[UIFont systemFontOfSize:17]];
}

-(void) createAdDisplayInfoArray {
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    NSDictionary *adDisplayInfos = @{
                                     @1: [[AdDisplayInfo alloc] initWithKey:@"320_50_iphone" Title:@"320 × 50 バナー" AdDisplayType:InLine
                                                                      Label:self.label_320_50_iphone Button:self.button_320_50_iphone
                                                                        pid:banner_320_50_pid mid:banner_320_50_mid sid:banner_320_50_sid CGSize:CGSizeMake(320, 50)
                                                          AdDisplayPosition:CGPointZero],
                                     
                                     @2: [[AdDisplayInfo alloc] initWithKey:@"320_100_iphone" Title:@"320 × 100 ビックバナー" AdDisplayType:InLine
                                                                      Label:self.label_320_100_iphone Button:self.button_320_100_iphone
                                                                        pid:banner_320_100_pid mid:banner_320_100_mid sid:banner_320_100_sid CGSize:CGSizeMake(320, 100)
                                                          AdDisplayPosition:CGPointZero],
                                     
                                     @3: [[AdDisplayInfo alloc] initWithKey:@"300_250_iphone" Title:@"300 × 250 ミディアムレクタングル" AdDisplayType:InLine
                                                                      Label:self.lable_300_250_iphone Button:self.button_300_250_iphone
                                                                        pid:banner_300_250_pid mid:banner_300_250_mid sid:banner_300_250_sid CGSize:CGSizeMake(300, 250)
                                                          AdDisplayPosition:CGPointZero],
                                     
                                     @4: [[AdDisplayInfo alloc] initWithKey:@"inter_iphone" Title:@"インタースティシャル" AdDisplayType:FullScreen
                                                                      Label:self.label_inter Button:self.button_inter
                                                                        pid:inter_pid mid:inter_mid sid:inter_sid],
                                     
                                     @5: [[AdDisplayInfo alloc] initWithKey:@"textpop_iphone" Title:@"テキストポップアップ" AdDisplayType:FullScreen
                                                                      Label:self.label_textpopup Button:self.button_textpopup
                                                                        pid:textpopup_pid mid:textpopup_mid sid:textpopup_sid],
                                     
                                     @6: [[AdDisplayInfo alloc] initWithKey:@"native_iphone" Title:@"ネイティブ" AdDisplayType:Native
                                                                      Label:self.label_SmallNative Button:self.button_SmallNative
                                                                        pid:native_small_pid mid:native_small_mid sid:native_small_sid],
                                     
                                     @7: [[AdDisplayInfo alloc] initWithKey:@"native_wide_iphone" Title:@"ネイティブ(ワイド)" AdDisplayType:Native
                                                                      Label:self.label_BigNative Button:self.button_BigNative
                                                                        pid:native_big_pid mid:native_big_mid sid:native_big_sid],
                                     
                                     @8: [[AdDisplayInfo alloc] initWithKey:@"native_infeed_iphone" Title:@"ネイティブ(インフィード)" AdDisplayType:NativeInfeed
                                                                      Label:self.label_InfeedNative Button:self.button_InfeedNative
                                                                        pid:native_infeed_pid mid:native_infeed_mid sid:native_infeed_sid],
                                     
                                     @9: [[AdDisplayInfo alloc] initWithKey:@"fullscreen_inline_iphone" Title:@"フルスクリーン広告 (インライン)" AdDisplayType:InLineFullScreen
                                                                      Label:self.label_FullScreenInline Button:self.button_FullScreenInter
                                                                        pid:fullscreen_inline_pid mid:fullscreen_inline_mid sid:fullscreen_inline_sid CGSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - statusHeight - navigationBarHeight)
                                                          AdDisplayPosition:CGPointMake(0, statusHeight + navigationBarHeight)],
                                     
                                    @10: [[AdDisplayInfo alloc] initWithKey:@"fullscreen_inter_iphone" Title:@"フルスクリーン広告 (全画面)" AdDisplayType:FullScreen
                                                                      Label:self.label_FullScreenInter Button:self.button_FullScreenInter
                                                                        pid:fullscreen_inter_pid mid:fullscreen_inter_mid sid:fullscreen_inter_sid]
                                     
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

- (void)resetId:(int)type{
    AdDisplayInfo *adDisplayInfo = [self.adDisplayInfos objectForKey:[NSNumber numberWithInt:type]];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *adID = adDisplayInfo.adID;
    NSString *pid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_pid",adID]];
    NSString *mid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_mid",adID]];
    NSString *sid = [userDefaults objectForKey:[NSString stringWithFormat:@"%@_sid",adID]];
    
    if (!pid || [pid length] == 0) pid = @"未設定";
    if (!mid || [mid length] == 0) mid = @"未設定";
    if (!sid || [sid length] == 0) sid = @"未設定";
    
    adDisplayInfo.label.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
}
- (IBAction)setting:(UIButton *)sender {
    [self adkey_load:(int)sender.tag];
}

- (void)adkey_load:(int)type{
    AdDisplayInfo *adDisplayInfo = [self.adDisplayInfos objectForKey:[NSNumber numberWithInt:type]];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *title = adDisplayInfo.adTitle;
    NSString *pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",adDisplayInfo.adID]];
    NSString *mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",adDisplayInfo.adID]];
    NSString *sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",adDisplayInfo.adID]];
    
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
    if ([[[UIDevice currentDevice] systemVersion] intValue] <= 6) {
        [_adinput addSubview:space];
    }else{
        [_adinput setValue:space forKey:@"accessoryView"];
    }
    
    UILabel * partner_label = [self createSettingsDescriptionLabel:@"PID" withYPosition:5];
    UILabel * media_label = [self createSettingsDescriptionLabel:@"MID" withYPosition:40];
    UILabel * ad_label = [self createSettingsDescriptionLabel:@"SID" withYPosition:80];
    partner_text = [self createSettingsInputTextFieldWithID:pid withYPosition:5];
    media_text = [self createSettingsInputTextFieldWithID:mid withYPosition:40];
    ad_text = [self createSettingsInputTextFieldWithID:sid withYPosition:80];
    
    [space addSubview:partner_label];
    [space addSubview:media_label];
    [space addSubview:ad_label];
    [space addSubview:partner_text];
    [space addSubview:media_text];
    [space addSubview:ad_text];
    
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


- (void)willPresentAlertView:(UIAlertView *)alertView{
    CGRect frame = alertView.frame;
    frame.origin.y = 100;
    frame.size.height = 250;
    alertView.frame = frame;
    
    for (UIView* view in alertView.subviews){
        frame = view.frame;
        if (frame.origin.y > 44) {
            frame.origin.y += 110;
            view.frame = frame;
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == alertView.cancelButtonIndex) {
    }else{
        AdDisplayInfo *adDisplayInfo = [self.adDisplayInfos objectForKey:@(alertView.tag)];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:partner_text.text forKey:[NSString stringWithFormat:@"%@_pid",adDisplayInfo.adID]];
        [userDefaults synchronize];
        [userDefaults setObject:media_text.text forKey:[NSString stringWithFormat:@"%@_mid",adDisplayInfo.adID]];
        [userDefaults synchronize];
        [userDefaults setObject:ad_text.text forKey:[NSString stringWithFormat:@"%@_sid",adDisplayInfo.adID]];
        [userDefaults synchronize];
        [self resetId:(int)alertView.tag];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
@end
