//
//  ViewController.m
//  scene
//
//  Created by Yukineko on 2014/05/31.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "Singleton.h"

@interface ViewController (){
    SystemSoundID seButton;
    AVAudioPlayer *bgm;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _comment.text = @"Take a Picture!";
    UIImage *initImage = [UIImage imageNamed:@"neko6.png"];
    [_cameraView setImage:initImage];
    _bButtonButtleStart.hidden = YES;
    _bCameraStart.hidden = NO;
    
    //Sound Effect
    NSString *pathSample3 = [[NSBundle mainBundle] pathForResource:@"sample3" ofType:@"mp3"];
    NSURL *urlSample3 = [NSURL fileURLWithPath:pathSample3];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(urlSample3), &seButton);
    
    //BGM
    [[Singleton bgm1] setNumberOfLoops:-1];
    [[Singleton bgm1] prepareToPlay];
    [[Singleton bgm1] play];
}

// This method is called when using camera
- (IBAction)cameraStart:(id)sender
{
    //SE
    AudioServicesPlaySystemSound(seButton);
    [Singleton setBGM:1];
    
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

- (IBAction)buttonButtleStart:(id)sender {
    AudioServicesPlaySystemSound(seButton);
//    [Singleton setBGM];
//    [[Singleton bgm1] stop];
//    [[Singleton bgm1] prepareToPlay];
}

// This method is called when finish to take a picture
- (void)imagePickerController:(UIImagePickerController *)imagePicker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _comment.text = @"finish takeing a picture";
    _bButtonButtleStart.hidden = NO;
    _bCameraStart.hidden = YES;
    
    //相手のパワーを設定する。
    int enemyPower2 = arc4random() % 10000;
    [Singleton setEnemyPower: enemyPower2];
    _enemyPower.text = [NSString stringWithFormat:@"power: %d",enemyPower2];
    
    UIImage *cameraImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // save the picture
    UIImageWriteToSavedPhotosAlbum(cameraImage, self, @selector(savedPic:didFinishSavingWithError:contentInfo:), nil);
    
    // draw the picture
    [_cameraView setImage:cameraImage];
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

// This method is called when failure starting camera
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)imagePicker
{
    _comment.text = @"cancel camera";
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)savedPic:(UIImage *)image didFinishSavingWithError:(NSError *)error contentInfo:(void *)contentInfo
{
    if(error == nil)
    {
        // when saving photo is successed
    } else {
        // when saving photo is failure
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
