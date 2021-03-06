//
//  MenuTableViewController.m
//  Sound of Seoul Second Demo
//
//  Created by Jinho Chung on 2014. 11. 16..
//  Copyright (c) 2014년 rchung. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    UINavigationController *navController = segue.destinationViewController;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = nil;
    
    // configure the destination view controller:
    if ( [sender isKindOfClass:[UITableViewCell class]] )
    {
        UILabel *label = (UILabel *)sender;
        NSString *text = label.text;

        if ([text isEqualToString:@"Map"]) {
            viewController = [storyboard instantiateViewControllerWithIdentifier:@"mapViewControllerIdentifier"];
            
        } else if ([text isEqualToString:@"Favorite"]) {
            viewController = [storyboard instantiateViewControllerWithIdentifier:@"favoriteViewControllerIdentifier"];
            
        } else if ([text isEqualToString:@"About"]) {
            viewController = [storyboard instantiateViewControllerWithIdentifier:@"aboutViewControllerIdentifier"];
            
        }
        [navController setViewControllers:[NSArray arrayWithObject:viewController] animated:NO];
    }
}


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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    NSString *identifier = nil;
    NSString *text = nil;
    
    switch (indexPath.row) {
        case 0:
            identifier = @"menuMapCell";
            text = @"Map";
            break;
            
        case 1:
            identifier = @"menuFavoriteCell";
            text = @"Favorite";
            break;
            
        case 2:
            identifier = @"menuAboutCell";
            text = @"About";
            break;
            
        default:
            break;
    }

    cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = text;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
