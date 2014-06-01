//
//  CountViewController.m
//  scene
//
//  Created by Yukineko on 2014/06/01.
//  Copyright (c) 2014年 Yukineko. All rights reserved.
//

#import "CountViewController.h"

@interface CountViewController (){
    NSInteger countdown;
    NSInteger shakeCountdown;
    NSTimer *tm;
    NSTimer *ttm;
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
    shakeCountdown = 5;
    _resultButton.hidden = YES;
    
    tm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(changeImage:) userInfo:nil repeats:YES];
    
    [tm fire];
 
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
    ttm = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(shake:) userInfo:nil repeats:YES];
    [ttm fire];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
