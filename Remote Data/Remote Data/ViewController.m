//
//  ViewController.m
//  Remote Data
//
//  Created by James McPherson on 10/21/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"
#import "Associate.h"
#import "AddAssociateViewController.h"
#import "AssociateDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Allocate and Initialize the NSMutable Array that will hold Associate Values from Queried database
    associateList = [[NSMutableArray alloc] init];
    
    // Log Total # of associate in database
    NSLog(@"%i", associateList.count);
    
}

// OnClick function checks for which button is pressed
-(IBAction)onClick:(id)sender{
    // Tags have been assigned to each button... switching between the 3 filter buttons
    switch ([sender tag]) {
        case 0:
            // Clear out the associateList Array to populate with impending Query
            [associateList removeAllObjects];
            // Create Query from Associate Table in Database
            query = [PFQuery queryWithClassName:@"Associate"];
            // Set the Cache Policy... Pull from Network, else cache results
            query.cachePolicy = kPFCachePolicyNetworkElseCache;
            // Limit query to firstName equal to Justin
            [query whereKey:@"firstName" equalTo:@"Justin"];
            // Assign Query Results to NSArray
            allArray = query.findObjects;
            // Loop through results
            for (PFObject* object in allArray){
                // Create new instance of Associate & Set Queried Values to appropriate Table Columns
                associate = [[Associate alloc]init];
                [associate setObjectId:object.objectId];
                [associate setFirstName:[object objectForKey:@"firstName"]];
                [associate setLastName:[object objectForKey:@"lastName"]];
                [associate setPhone:[object objectForKey:@"phoneNumber"]];
                [associate setEmail:[object objectForKey:@"email"]];
                [associate setCompId:[object objectForKey:@"compId"]];
                [associate setStatus:[object objectForKey:@"status"]];
                // add associate to NSMutableArray
                [associateList addObject:associate];
            }
            // Reload Tableview Data
            [myTableView reloadData];
            break;
        case 1:
            // Clear out associateList
            [associateList removeAllObjects];
            // Create Query from Associate Table in Database
            query = [PFQuery queryWithClassName:@"Associate"];
            // Set Cache Policy
            query.cachePolicy = kPFCachePolicyNetworkElseCache;
            // Populate NSArray with Query Results
            allArray = query.findObjects;
            // Loop through results
            for (PFObject* object in allArray){
                // New instance of Associate
                associate = [[Associate alloc]init];
                // Place objects accordingly
                [associate setObjectId:object.objectId];
                [associate setFirstName:[object objectForKey:@"firstName"]];
                [associate setLastName:[object objectForKey:@"lastName"]];
                [associate setPhone:[object objectForKey:@"phoneNumber"]];
                [associate setEmail:[object objectForKey:@"email"]];
                [associate setCompId:[object objectForKey:@"compId"]];
                [associate setStatus:[object objectForKey:@"status"]];
                // Add Associate to associateList
                [associateList addObject:associate];
            }
            // Reload TableView
            [myTableView reloadData];
            break;
        case 2:
            // Again... Remove all Objects in associateList
            [associateList removeAllObjects];
            // Create new Query from Associate Table in Database
            query = [PFQuery queryWithClassName:@"Associate"];
            // Set Cache Policy
            query.cachePolicy = kPFCachePolicyNetworkElseCache;
            // Query on Part Time Status
            [query whereKey:@"status" equalTo:@"Part Time"];
            // Populate NSArray with Queried results
            allArray = query.findObjects;
            // Loop through array
            for (PFObject* object in allArray){
                // New Instance of Associate
                associate = [[Associate alloc]init];
                // Set Objects Accordingly
                [associate setObjectId:object.objectId];
                [associate setFirstName:[object objectForKey:@"firstName"]];
                [associate setLastName:[object objectForKey:@"lastName"]];
                [associate setPhone:[object objectForKey:@"phoneNumber"]];
                [associate setEmail:[object objectForKey:@"email"]];
                [associate setCompId:[object objectForKey:@"compId"]];
                [associate setStatus:[object objectForKey:@"status"]];
                // Add Associate to associateList
                [associateList addObject:associate];
            }
            // Reload TableView
            [myTableView reloadData];
        default:
            break;
    }
}

//Segue Settings
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Declare View Controller Classes
    AddAssociateViewController* addView = (AddAssociateViewController*)[segue destinationViewController];
    AssociateDetailViewController* detailView = (AssociateDetailViewController*)[segue destinationViewController];
    // Create IndexPath that will reflect Which TableView Row was selected
    NSIndexPath* indexPath = [myTableView indexPathForSelectedRow];
    //Check for which segue user initiated
    if ([segue.identifier isEqualToString:@"segueToAddAssociate"]) {
        if (addView != nil) {
            NSLog(@"Transition to AddAssociateViewController");
        }
    } else {
        if (detailView != nil) {
            NSLog(@"Transition to AssociateDetailViewController");
            // Create new instance of Associate and populate with values from selected row
            item = [associateList objectAtIndex:indexPath.row];
            // Set objectIdString == objectId from selected row
            objectIdString = item.getObjectId;
            
            // Create local string variables for ease
            NSString* firstName = item.getFirstName;
            NSString* lastName = item.getLastName;
            NSString* phone = item.getPhone;
            NSString* email = item.getEmail;
            NSString* comp = item.getCompId;
            NSString* status = item.getStatus;
            
            // pass item values to AssociateDetailViewController
            detailView.objectId = objectIdString;
            detailView.firstName = firstName;
            detailView.lastName = lastName;
            detailView.phone = phone;
            detailView.email = email;
            detailView.comp = comp;
            detailView.status = status;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set the height of the TableViewCells
    int height = 70;
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of Associates in associateList
    return associateList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Configure The Cell
    item = [associateList objectAtIndex:indexPath.row];

    //define cell
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    if (cell != nil) {
        // Se the Custom Cell Labels with appropriate data
        NSString* nameString = [[NSString alloc] initWithFormat:@"%@ %@", [item getFirstName], [item getLastName]];
        cell.nameLabel.text = nameString;
        cell.phoneLabel.text = [item getPhone];
        cell.emailLabel.text = [item getEmail];
        cell.compLabel.text = [item getCompId];
        cell.statusLabel.text = [item getStatus];
    }
    // Return Cell
    return cell;
}

@end
