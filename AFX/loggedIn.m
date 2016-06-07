//
//  loggedIn.m
//  LoginUser
//
//  Created by Leon Cao on 2014-11-05.
//  Copyright (c) 2014 Leon Cao. All rights reserved.
//

#import "loggedIn.h"

@implementation loggedIn

- (IBAction)logOut:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changePassword:(id)sender {
    //[self performSegueWithIdentifier:@"changePassword" sender:self];
}
@end
