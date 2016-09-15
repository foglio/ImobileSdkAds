//
//  AdDisplayInfo.h
//  imobilesample
//
//  Created by tsuchiyahiroki on 2016/05/31.
//  Copyright © 2016年 i-mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Imobile_spot_info.h"

@interface AdDisplayInfo : NSObject
@property (nonatomic) NSString *adID;
@property (nonatomic) NSString *adTitle;
@property (nonatomic) NSString *pid;
@property (nonatomic) NSString *mid;
@property (nonatomic) NSString *sid;
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIButton *button;
@property (nonatomic) AdDisplayType adDisplayType;
@property (nonatomic) CGPoint adDisplayPosition;
@property (nonatomic) CGSize size;

-(id)initWithKey:(NSString*)key Title:(NSString *)title AdDisplayType:(AdDisplayType)adDisplayType
           Label:(UILabel *)label Button:(UIButton *)button
             pid:(NSString *)pid mid:(NSString *)mid sid:(NSString *)sid;
- (id)initWithKey:(NSString*)key Title:(NSString *)title AdDisplayType:(AdDisplayType)adDisplayType
            Label:(UILabel *)label Button:(UIButton *)button
              pid:(NSString *)pid mid:(NSString *)mid sid:(NSString *)sid CGSize:(CGSize)size AdDisplayPosition:(CGPoint) adDisplayPosition;
@end
