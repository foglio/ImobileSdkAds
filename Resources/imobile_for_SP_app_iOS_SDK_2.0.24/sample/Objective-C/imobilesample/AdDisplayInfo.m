//
//  AdDisplayInfo.m
//  imobilesample
//
//  Created by tsuchiyahiroki on 2016/05/31.
//  Copyright © 2016年 i-mobile. All rights reserved.
//

#import "AdDisplayInfo.h"

@implementation AdDisplayInfo

- (id)initWithKey:(NSString*)key Title:(NSString *)title AdDisplayType:(AdDisplayType)adDisplayType
            Label:(UILabel *)label Button:(UIButton *)button
              pid:(NSString *)pid mid:(NSString *)mid sid:(NSString *)sid{
    if(self = [super init]){
        self.adID = key;
        self.adTitle = title;
        self.adDisplayType = adDisplayType;
        self.pid = pid;
        self.mid = mid;
        self.sid = sid;
        self.label = label;
        self.button = button;
    }
    return self;
}

- (id)initWithKey:(NSString*)key Title:(NSString *)title AdDisplayType:(AdDisplayType)adDisplayType
            Label:(UILabel *)label Button:(UIButton *)button
              pid:(NSString *)pid mid:(NSString *)mid sid:(NSString *)sid CGSize:(CGSize)size AdDisplayPosition:(CGPoint) adDisplayPosition{
    if(self = [super init]){
        self.adID = key;
        self.adTitle = title;
        self.adDisplayType = adDisplayType;
        self.pid = pid;
        self.mid = mid;
        self.sid = sid;
        self.size = size;
        self.label = label;
        self.button = button;
        self.adDisplayPosition = adDisplayPosition;
    }
    return self;
}

@end
