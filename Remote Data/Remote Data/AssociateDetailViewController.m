//
//  AssociateDetailViewController.m
//  Remote Data
//
//  Created by James McPherson on 10/24/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import "AssociateDetailViewController.h"
#import <Parse/Parse.h>
#import "ViewController.h"
#import "EditAssociateViewController.h"

@interface AssociateDetailViewController ()

@end

@implementation AssociateDetailViewController

// Synthesize Global Variables
@synthesize objectId, firstName, lastName, phone, email, comp, status;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Set UILabels with data passed from ViewController
    nameLabel.text = [[NSString alloc] initWithFormat:@"%@ %@", firstName, lastName];
    phoneLabel.text = phone;
    emailLabel.text = email;
    compLabel.text = comp;
    statusLabel.text = status;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Custom OnDelete Method
-(IBAction)onDelete:(id)sender{
    // Create Local Array to hold Query Objects
    NSArray* associate = [[NSArray alloc] init];
    // Query Associate Table in Database
    PFQuery* query = [PFQuery queryWithClassName:@"Associate"];
    // Set Cache Policy
    query.cachePolicy = kPFCachePolicyNetworkElseCache;
    // Query for objectId
    [query whereKey:@"objectId" equalTo:objectId];
    // Place query results into NSArray
    associate = query.findObjects;
    
    for (PFObject* object in associate){
        // Delete the object from Database
        [object deleteEventually];
        
        //Update the tableView in ViewController
        ViewController* mainView = [[ViewController alloc] init];
        //Attempt to reload data, but really doesn't do much for me
        [mainView.myTableView reloadData];
        // Release Current View Controller and navigate to Main View
        [self.navigationController popViewControllerAnimated:TRUE];
    }
}
// Segue Setup
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Create Instance of EditAssociateViewController
    EditAssociateViewController* editView = (EditAssociateViewController*)[segue destinationViewController];
    
    //Check for which segue user initiated
    if ([segue.identifier isEqualToString:@"segueToEditAssociate"]) {
        // Log first name for verification of data being passed
        NSLog(@"%@", firstName);
        
        // Create local string variables
        NSString* objectIdString = objectId;
        NSString* firstString = firstName;
        NSString* lastString = lastName;
        NSString* phoneString = phone;
        NSString* emailString = email;
        NSString* compString = comp;
        NSString* statusString = status;
        
        // pass item values to EditAssociateViewController
        editView.objectId = objectIdString;
        editView.firstName = firstString;
        editView.lastName = lastString;
        editView.phone = phoneString;
        editView.email = emailString;
        editView.comp = compString;
        editView.status = statusString;
    }
}

@end
