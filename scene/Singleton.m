//
//  Singleton.m
//  scene
//
//  Created by 三栖 惇 on 2014/06/04.
//  Copyright (c) 2014年 三栖 惇. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (Singleton*) instance
{
    static Singleton * instance = nil;
    if (instance == nil) {
        instance = [[Singleton alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"sample2" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:path];
        NSError* error = nil;
        instance.bgm1 = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: &error];
    }
    return instance;
}

+ (AVAudioPlayer *)bgm1
{
    return [Singleton instance].bgm1;
}

@end
