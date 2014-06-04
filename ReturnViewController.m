//
//  ReturnViewController.m
//  scene
//
//  Created by Yukineko on 2014/06/01.
//  Copyright (c) 2014年 Yukineko. All rights reserved.
//

#import "ReturnViewController.h"
#import "Singleton.h"

@interface ReturnViewController ()

@end

@implementation ReturnViewController

//@synthesize svStr;

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
    // Do any additional setup after loading the view.
    
    _enemyScore.text = [NSString stringWithFormat:@"enemy:%d",[Singleton enemyPower]];
    _myScore.text = [NSString stringWithFormat:@"you:%d",(int)[Singleton power2]];
    if([Singleton power2]>= [Singleton enemyPower]){
        _score.text = @"You Win!!";
    }
    else{
        _score.text = @"You Lose!!";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
