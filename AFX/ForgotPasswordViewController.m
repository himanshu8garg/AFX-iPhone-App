//
//  ForgotPasswordViewController.m
//  AFX
//
//  Created by Leon Cao on 2014-11-09.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "NSString+Hashes.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _usernameField.hidden = NO;
    _emailField.hidden = NO;
    _continueBtn.hidden = NO;
    _passwordField.hidden = YES;
    _reEnterPasswordField.hidden = YES;
    _confirmBtn.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)confirmMatch:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //encrypt the username so we can compare it with database username
    _usernameField.text = [_usernameField.text md5];
    //NSLog(@"%@" ,[_passwordField text]);
    if ([[defaults objectForKey:@"username"] isEqualToString:_usernameField.text]&&[[defaults objectForKey:@"email"] isEqualToString:_emailField.text]) {
        NSLog(@"Yes it matches");
        _usernameField.hidden = YES;
        _emailField.hidden = YES;
        _continueBtn.hidden = YES;
        _passwordField.hidden = NO;
        _reEnterPasswordField.hidden = NO;
        _confirmBtn.hidden = NO;
    }
        
    
    else{
        NSLog(@"No sorry, no match");
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The information you entered does not match our database." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
}

- (IBAction)goBackLogin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)confirmPassword:(id)sender {
    if([_passwordField.text isEqualToString:@"" ] || [_reEnterPasswordField.text isEqualToString:@""]){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill out all the fields." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    else if([_passwordField.text length] <6){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Password Error" message:@"Your password must contain 6 or more characters" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        
        [error show];
        
    }
    else if ([_passwordField.text isEqualToString:_reEnterPasswordField.text]){
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Are you sure you want this password?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [error show];
    }
    else{
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Passwords do not match." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        //this is no
        _passwordField.text = nil;
        _reEnterPasswordField.text = nil;
    }
    else if(buttonIndex == 1){
         NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        //this is yes
        NSLog(@"Yes it matches");
        //encrypt it
        _passwordField.text = [_passwordField.text md5];
        //NSLog(@"%@" ,[_passwordField text]);
        //Now set the new password
        [defaults setObject:_passwordField.text forKey:@"password"];
        [defaults synchronize];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
