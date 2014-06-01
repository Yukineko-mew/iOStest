//
//  CountViewController.m
//  scene
//
//  Created by Yukineko on 2014/06/01.
//  Copyright (c) 2014年 Yukineko. All rights reserved.
//

#import "CountViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "ViewController.h"

@interface CountViewController (){
    NSInteger countdown;
    NSInteger shakeCountdown;
    NSTimer *tm;
    NSTimer *ttm;
    CMMotionManager *manager;
    BOOL start;
    double power;
}

@end

@implementation CountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    countdown = 3;
    shakeCountdown = 500;
    _resultButton.hidden = YES;
    
    tm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(changeImage:) userInfo:nil repeats:YES];
    
    [tm fire];
    
    // Do any additional setup after loading the view, typically from a nib.
    int frequency = 50;
    
    // 周波数(Hz)
    manager = [[CMMotionManager alloc] init];
    power=0;
    start=NO;
    
    // CMAccelerometerDataの開始
    [self startCMAccelerometerData:frequency];

 
}

-(void)changeImage:(NSTimer *)timer
{
    UIImage *img;
    switch (countdown) {
        case 3:
            img = [UIImage imageNamed:@"neko6 3.png"];
            [_countView setImage:img];
            countdown--;
            break;
        case 2:
            img = [UIImage imageNamed:@"neko6 2.png"];
            [_countView setImage:img];
            countdown--;
            break;
        case 1:
            img = [UIImage imageNamed:@"neko6 1.png"];
            [_countView setImage:img];
            countdown--;
            break;
        default:
            countdown = 3;
            img = [UIImage imageNamed:@"neko6.png"];
            [_countView setImage:img];
            [tm invalidate];
            
            [self shakeStart];
            break;
    }
}

- (void)shakeStart
{
    //ttm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(shake:) userInfo:nil repeats:YES];
    //[ttm fire];
    [_countLabel setText:[NSString stringWithFormat:@"%ld", (long)shakeCountdown]];
    start=YES;
}

- (void)result:(id)sender
{

}

- (void)shake:(NSTimer *)timer
{
    if(shakeCountdown == 0)
    {
        _resultButton.hidden = NO;
        [ttm invalidate];
        shakeCountdown = 5;
    } else {
        [_countLabel setText:[NSString stringWithFormat:@"%ld", (long)shakeCountdown]];
        shakeCountdown--;
    }

}

- (void)startCMAccelerometerData:(int)frequency
{
    // 加速度センサーの有無を確認
    if (manager.accelerometerAvailable) {
        
        // 更新間隔の指定
        manager.accelerometerUpdateInterval = 1 / frequency;  // 秒
        
        // ハンドラ
        CMAccelerometerHandler handler = ^(CMAccelerometerData *data, NSError *error) {
            // double timestamp = data.timestamp;
            if (start == YES){
                power=  power+ fabs(data.acceleration.x)+fabs(data.acceleration.y)+fabs(data.acceleration.z);
                _scouter.text = [NSString stringWithFormat:@"スカウター:%lf",power];
                [_countLabel setText:[NSString stringWithFormat:@"%ld", (long)shakeCountdown]];
                shakeCountdown--;
            }
            if (shakeCountdown==0) {
                _resultButton.hidden = NO;
                start=NO;
                [ttm invalidate];
                shakeCountdown=500;
            }
        };
        // センサーの利用開始
        [manager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handler];
    }
}



-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
