//
//  AddReminderViewController.m
//  AFX
//
//  Created by Leon Cao on 2014-11-29.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import "AddReminderViewController.h"

@interface AddReminderViewController ()

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveButton:(UIBarButtonItem *)sender {
    
    NSDate *pickDate = [self.datePicker date];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    localNotification.alertBody = _enterText.text;
    localNotification.fireDate = pickDate;
    localNotification.soundName = (UILocalNotificationDefaultSoundName);
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.repeatInterval = NSWeekCalendarUnit;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)cancelButton:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
