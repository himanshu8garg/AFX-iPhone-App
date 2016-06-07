//
//  ForgotPasswordViewController.h
//  AFX
//
//  Created by Leon Cao on 2014-11-09.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *continueBtn;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *goBackBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

- (IBAction)confirmMatch:(id)sender;
- (IBAction)goBackLogin:(id)sender;
- (IBAction)confirmPassword:(id)sender;

@end
