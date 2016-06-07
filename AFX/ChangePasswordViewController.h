//
//  ChangePasswordViewController.h
//  AFX
//
//  Created by Leon Cao on 2014-11-09.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *currentPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

- (IBAction)confirmPassword:(id)sender;

@end
