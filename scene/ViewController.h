//
//  ViewController.h
//  scene
//
//  Created by Yukineko on 2014/05/31.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property IBOutlet UIButton *bCameraStart;
@property IBOutlet UILabel *comment;

@property IBOutlet UIImageView *cameraView;

-(IBAction)cameraStart:(id)sender;

@end
