//
//  LoginUserViewController.h
//  LoginUser
//
//  Created by Leon Cao on 2014-11-05.
//  Copyright (c) 2014 Leon Cao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginUserViewController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordBtn;


-(IBAction)registerUser:(id)sender;
-(IBAction)LoginUser:(id)sender;
- (IBAction)forgotPassword:(id)sender;




@end

