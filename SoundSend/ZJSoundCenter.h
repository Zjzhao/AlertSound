//
//  ZJSoundCenter.h
//  SoundSend
//
//  Created by 赵张杰 on 2017/9/7.
//  Copyright © 2017年 赵张杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(unsigned char, ZJSoundType) {
    ZJSoundTypeMessage,
    ZJSoundTypeNormalButton,
    ZJSoundtypeCustomButton,
};

@interface ZJSoundCenter : NSObject

+ (id)shareCenter;
- (void)playSound:(ZJSoundType)type;

@end
