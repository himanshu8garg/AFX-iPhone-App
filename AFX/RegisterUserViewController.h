//
//  RegisterUserViewController.h
//  AFX
//
//  Created by Leon Cao on 2014-11-07.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterUserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

-(IBAction)registerUser:(id)sender;
@end
