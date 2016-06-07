//
//  ChangePasswordViewController.m
//  AFX
//
//  Created by Leon Cao on 2014-11-09.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "NSString+Hashes.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0.208 green:0.686 blue:0.929 alpha:1]];
    [[UITabBar appearance]setBarTintColor:[UIColor colorWithRed:0.208 green:0.686 blue:0.929 alpha:1]];
    [[UITabBar appearance]setTintColor: [UIColor whiteColor]];
}

- (IBAction)confirmPassword:(id)sender {
    if ([_currentPasswordField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please fill out all fields"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [error show];
    }
    else{
        [self changePassword];

    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        //this is no
    }
    else if(buttonIndex == 1){
        //this is yes
        //encrypt password
        _passwordField.text = [_passwordField.text md5];
     //   NSLog(@"%@" ,[_passwordField text]);
        
        //Now save it into database
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:_passwordField.text forKey:@"password"];
        [defaults synchronize];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void) changePassword {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([_currentPasswordField.text isEqualToString:[defaults objectForKey:@"password"]] && [_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        UIAlertView *confirm = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                          message:@"Are you sure you want to change your password?"
                                                         delegate:self
                                                cancelButtonTitle:@"No"
                                                otherButtonTitles:@"Yes", nil];
                [confirm show];
    }
    else{
        if (![_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"The new password does not match"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [error show];
            _reEnterPasswordField.text = nil;
            _currentPasswordField.text = nil;
            _passwordField.text = nil;
        }
        else if(![_currentPasswordField.text isEqualToString: [defaults objectForKey:@"password"]]){
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"The current password does not match our database"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [error show];
            _reEnterPasswordField.text = nil;
            _currentPasswordField.text = nil;
            _passwordField.text = nil;
        }
        else if([_passwordField.text length] <6){
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Password Error" message:@"Your password must contain 6 or more characters" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            
            [error show];
            
        }

    }
}
@end
