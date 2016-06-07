//
//  AddReminderViewController.h
//  AFX
//
//  Created by Leon Cao on 2014-11-29.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddReminderViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *enterText;

- (IBAction)saveButton:(UIBarButtonItem *)sender;
- (IBAction)cancelButton:(UIBarButtonItem *)sender;

@end
