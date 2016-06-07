//
//  ViewRemindersTableViewController.m
//  AFX
//
//  Created by Leon Cao on 2014-11-29.
//  Copyright (c) 2014 AFX. All rights reserved.
//

#import "ViewRemindersTableViewController.h"

@interface ViewRemindersTableViewController ()

@end

@implementation ViewRemindersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[[UIApplication sharedApplication]scheduledLocalNotifications]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"reminderCell"
                                                            forIndexPath:indexPath];
    NSArray *notificationsArray = [[UIApplication sharedApplication]scheduledLocalNotifications];
    
    UILocalNotification *notification = [notificationsArray objectAtIndex:indexPath.row];
    
    //Create two instance of NSDateFormatter so that we can change the formats of the two labels
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle: (NSDateFormatterLongStyle)];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc]init];
    [timeFormatter setDateFormat: @"h:mm aa"];
    
    NSString *fireDate = [dateFormatter stringFromDate:notification.fireDate];
    NSString *fireTime = [timeFormatter stringFromDate:notification.fireDate];
    
    NSString *dateTime = [NSString stringWithFormat:@"%@ - %@" , fireDate, fireTime];
    
    
    //Now lets set the lables in our table
    [cell.textLabel setText:notification.alertBody];
   // [cell.detailTextLabel setText:[notification.fireDate description]];
    [cell.detailTextLabel setText:dateTime];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSArray *notificationsArray = [[UIApplication sharedApplication]scheduledLocalNotifications];
        
        [[UIApplication sharedApplication]cancelLocalNotification:[notificationsArray objectAtIndex:indexPath.row]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
