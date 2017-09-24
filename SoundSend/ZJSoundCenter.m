//
//  ZJSoundCenter.m
//  SoundSend
//
//  Created by 赵张杰 on 2017/9/7.
//  Copyright © 2017年 赵张杰. All rights reserved.
//

#import "ZJSoundCenter.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@implementation ZJSoundCenter {
    SystemSoundID _custom_audio_id;
}

+ (id)shareCenter {
    static ZJSoundCenter *instance = nil;
    if (!instance) {
        instance = [[ZJSoundCenter alloc] init];
    }
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self registerSystemSound];
    }
    return self;
}

- (void)playSystemSound:(int)sound {
    AudioServicesPlaySystemSound(sound);
}

- (int)soundWithType:(int)type {
    switch (type) {
        case ZJSoundTypeMessage:return 1315;
        case ZJSoundTypeNormalButton:return 1103;
        case ZJSoundtypeCustomButton:return _custom_audio_id;
        default:return 0;
    }
}

- (void)playSound:(ZJSoundType)type {
    [self playSystemSound:[self soundWithType:type]];
}

- (void)noGoon {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(playSound:) object:nil];
    [self performSelector:@selector(playSound:) withObject:self afterDelay:0];
}

- (void)registerSystemSound {
    NSURL* system_sound_url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                      pathForResource:@"8923" ofType:@"wav"]];
    SystemSoundID system_sound_id;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)system_sound_url,&system_sound_id);
    AudioServicesAddSystemSoundCompletion(system_sound_id,NULL,NULL,MySoundFinishedPlayingCallback,NULL);
    _custom_audio_id = system_sound_id;
}

void MySoundFinishedPlayingCallback(SystemSoundID sound_id, void* user_data) {
//    AudioServicesDisposeSystemSoundID(sound_id);
    [[ZJSoundCenter shareCenter] noGoon];
}


@end
