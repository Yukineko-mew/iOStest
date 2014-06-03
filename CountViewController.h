//
//  CountViewController.h
//  scene
//
//  Created by Yukineko on 2014/06/01.
//  Copyright (c) 2014年 Yukineko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReturnViewController.h"

@interface CountViewController : UIViewController

@property IBOutlet UIImageView *countView;
@property IBOutlet UIButton *resultButton;
@property IBOutlet UILabel *countLabel;
@property IBOutlet UILabel *scouter;

-(IBAction)result:(id)sender;

@end
