//
//  ViewController.m
//  scene
//
//  Created by Yukineko on 2014/05/31.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _comment.text = @"Start!";
    UIImage *initImage = [UIImage imageNamed:@"neko6.png"];
    [_cameraView setImage:initImage];
}

// This method is called when using camera
- (IBAction)cameraStart:(id)sender
{
    // camera is usable?
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if([UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        _comment.text = @"starting cammera is success";
        UIImagePickerController *cameraPicker = [[UIImagePickerController alloc ] init];
        cameraPicker.sourceType = sourceType;
        cameraPicker.delegate = self;
        
        [self presentViewController:cameraPicker animated:YES completion:nil];
    } else {
        _comment.text = @"starting camera is failue";
    }
}

// This method is called when finish to take a picture
- (void)imagePickerController:(UIImagePickerController *)imagePicker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _comment.text = @"finish takeing a picture";
    UIImage *cameraImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [_cameraView setImage:cameraImage];
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
    
}

// This method is called when failue starting camera
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)imagePicker
{
    _comment.text = @"cancel camera";
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
