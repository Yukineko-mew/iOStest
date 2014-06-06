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



+ (Singleton*) powerInstance
{
    static Singleton *powerInstance = nil;
    if(powerInstance == nil){
        powerInstance = [[Singleton alloc] init];
        powerInstance.power2 = 0;
    }
    return powerInstance;
}

+ (void) setBGM:(int)bgm
{
    NSString *pathBGM;
    if (bgm==1) {
        pathBGM = [[NSBundle mainBundle] pathForResource:@"buttle" ofType:@"mp3"];
    }else if (bgm == 2){
        pathBGM = [[NSBundle mainBundle] pathForResource:@"win" ofType:@"mp3"];
    }else if (bgm == 3){
        pathBGM = [[NSBundle mainBundle] pathForResource:@"fail" ofType:@"mp3"];
    }
    NSURL *urlBGM = [NSURL fileURLWithPath:pathBGM];
    [Singleton instance].bgm1 = [[AVAudioPlayer alloc] initWithContentsOfURL:urlBGM error:nil];
}

+ (double) power2
{
    return [Singleton powerInstance].power2;
}

+ (void) setPower:(double)_power2
{
    [Singleton powerInstance].power2 = _power2;
}

+ (Singleton*) enemyPowerInstance
{
    static Singleton *enemyPowerInstance = nil;
    if(enemyPowerInstance == nil){
        enemyPowerInstance = [[Singleton alloc] init];
        enemyPowerInstance.enemyPower = 0;
    }
    return enemyPowerInstance;
}

+ (int) enemyPower
{
    return [Singleton enemyPowerInstance].enemyPower;
}

+ (void) setEnemyPower:(int)_enemyPower
{
    [Singleton enemyPowerInstance].enemyPower = _enemyPower;
}

@end
