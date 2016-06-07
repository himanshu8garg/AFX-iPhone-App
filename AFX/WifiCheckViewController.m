//
//  WifiCheckViewController.m
//  AFX
//
//  Created by Leon Cao on 2014-11-30.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import "WifiCheckViewController.h"

@interface WifiCheckViewController ()

@end

@implementation WifiCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //this will check wifi
    [self hasInternet];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) hasInternet{
    //We will use google.com as a host to test our WiFi
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus internetStats = [reach currentReachabilityStatus];
    
    //If google.com does not load, we will assume that WiFi is off
    if (internetStats == NotReachable) {
        UIAlertView *alertOne = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your WiFi is not turned on! There may be incurring charges from your data provider. Please turn on WiFi. " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertOne show];
    }
    //If google.com loads, then we assume WiFi is on
    else {
        UIAlertView *alertTwo = [[UIAlertView alloc] initWithTitle:@"Internet" message:@"Your WiFi is turned on! Just keep up with what your doing!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertTwo show];
    }
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
