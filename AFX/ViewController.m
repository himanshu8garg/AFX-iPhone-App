//
//  ViewController.m
//  AFX
//
//  Created by Leon Cao on 2014-10-25.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import "ViewController.h"
#import "MediaPlayer/MediaPlayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)plantarFlexion:(id)sender {
    NSURL *url= [NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"Plantar Flexion.mp4"]];
    MPMoviePlayerController *player= [[MPMoviePlayerController alloc ]initWithContentURL:url];
    player.scalingMode=MPMovieScalingModeAspectFit;
    [player play];
    MPMoviePlayerViewController *MPviewController=[[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:MPviewController];
}

- (IBAction)dorsiFlexion:(id)sender {
    NSURL *url= [NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"Dorsi Flexion.mp4"]];
    MPMoviePlayerController *player= [[MPMoviePlayerController alloc ]initWithContentURL:url];
    player.scalingMode=MPMovieScalingModeAspectFit;
    [player play];
    MPMoviePlayerViewController *MPviewController=[[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:MPviewController];
}

- (IBAction)ankleInversion:(id)sender {
    NSURL *url= [NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"Ankle Inversion.mp4"]];
    MPMoviePlayerController *player= [[MPMoviePlayerController alloc ]initWithContentURL:url];
    player.scalingMode=MPMovieScalingModeAspectFit;
    [player play];
    MPMoviePlayerViewController *MPviewController=[[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:MPviewController];
}

- (IBAction)ankleEversion:(id)sender {
    NSURL *url= [NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"optimized ankle eversion.mp4"]];
    MPMoviePlayerController *player= [[MPMoviePlayerController alloc ]initWithContentURL:url];
    player.scalingMode=MPMovieScalingModeAspectFit;
    [player play];
    MPMoviePlayerViewController *MPviewController=[[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:MPviewController];}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0.208 green:0.686 blue:0.929 alpha:1]];
    [[UITabBar appearance]setBarTintColor:[UIColor colorWithRed:0.208 green:0.686 blue:0.929 alpha:1]];
    [[UITabBar appearance]setTintColor: [UIColor whiteColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
