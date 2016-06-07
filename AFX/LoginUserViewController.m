//
//  LoginUserViewController.m
//  LoginUser
//
//  Created by Leon Cao on 2014-11-05.
//  Copyright (c) 2014 Leon Cao. All rights reserved.
//

#import "LoginUserViewController.h"
#import "NSString+Hashes.h"

@interface LoginUserViewController ()

@end

@implementation LoginUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //if statement to check if there is a registered user or not
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults boolForKey:@"registered"]) {
        NSLog(@"No user registered");
        _loginBtn.hidden = YES; //hide login button because no user is regsitered
        _forgotPasswordBtn.hidden = YES;
    }
    else {
        NSLog(@"user is registered");
        _loginBtn.hidden = NO;
        _reEnterPasswordField.hidden = YES;
        _registerBtn.hidden = YES;
        _emailField.hidden = YES;
        _forgotPasswordBtn.hidden = NO;
    }
   
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

- (IBAction)registerUser:(id)sender {
    
    //check if all text fields are completed
    if ([_usernameField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]||
        [_emailField.text isEqualToString:@""]) {
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        
        [error show];
    }
    //username must be 4 or more characters long
    else if([_usernameField.text length] < 4){
        //if less than 4 characters display an error
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Username Error" message:@"Your username must be 4 or more characters long" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        
        [error show];
    }
    else if([_passwordField.text length] <6){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Password Error" message:@"Your password must contain 6 or more characters" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        
        [error show];

    }
    else {
        if(![self validateEmail:[_emailField text]]) {
            // user entered invalid email address
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Error" message:@"Enter a valid email address." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else {
            // user entered valid email address
            [self checkPasswordsMatch];
        }
    }
}

- (void) checkPasswordsMatch {
    
    //check that the two apssword fields are identical
    if ([_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        NSLog(@"passwords match!");
        [self registerNewUser];
    }
    else {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Password Error" message:@"Your entered passwords do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [error show];
    }
    
}

- (void) registerNewUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //Before we enter our username and password we have to hash it
    //We are going to use md5 hashing
    
    _usernameField.text = [_usernameField.text md5];
    _passwordField.text = [_passwordField.text md5];
  //  NSLog(@"%@" ,[_usernameField text]);
  //  NSLog(@"%@" ,[_passwordField text]);

    
    //write the username and password and set BOOL value in NSUserDefaults
    [defaults setObject:_usernameField.text forKey:@"username"];
    [defaults setObject:_passwordField.text forKey:@"password"];
    [defaults setObject:_emailField.text forKey:@"email"];
    [defaults setBool:YES forKey:@"registered"];
    
    [defaults synchronize];
    
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Welcome To AFX" message:@"You have successfully registered an account with AFX!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [success show];
    
    [self viewDidLoad];
    _usernameField.text = nil;
    _passwordField.text = nil;
    
    [self performSegueWithIdentifier:@"login" sender:self];
    
}

- (IBAction)LoginUser:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //Hash the username and password before comparing
    _usernameField.text = [_usernameField.text md5];
    _passwordField.text = [_passwordField.text md5];
    //NSLog(@"%@" ,[_usernameField text]);
    //NSLog(@"%@" ,[_passwordField text]);
    
    //check that username and password match stored values
    if ([_usernameField.text isEqualToString:[defaults objectForKey:@"username"]] && [_passwordField.text isEqualToString:[defaults objectForKey:@"password"]]) {
        _usernameField.text = nil;
        _passwordField.text = nil;
        [self performSegueWithIdentifier:@"login" sender:self]; //perform segue to next view controller
    }
    else {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Sorry, Does Not Match!" message:@"Your username and password does not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [error show];
        _usernameField.text = nil;
        _passwordField.text = nil;
    }
}

- (IBAction)forgotPassword:(id)sender {
    [self performSegueWithIdentifier:@"forgotPassword" sender:self];
}


- (BOOL)validateEmail:(NSString *)emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}

@end
