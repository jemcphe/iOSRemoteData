//
//  ViewController.h
//  Remote Data
//
//  Created by James McPherson on 10/21/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Associate.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    // Create UI Elements
    IBOutlet UITableView* myTableView;
    IBOutlet UIButton* singleButton;
    IBOutlet UIButton* allButton;
    IBOutlet UIButton* statusButton;
    
    // Associate Objects & Query
    Associate* associate;
    Associate* item;
    PFQuery* query;
    
    // Arrays to hold query values
    NSArray* allArray;
    NSArray* singleArray;
    NSArray* statusArray;
    
    // Adjustable Array to hold returned associate values from database
    NSMutableArray* associateList;
    
    // String to hold objectId for database manipulation
    NSString* objectIdString;
}

// Making tableView global for testing purposes
@property (strong, nonatomic) IBOutlet UITableView* myTableView;

// OnClick function for when buttons are pressed
-(IBAction)onClick:(id)sender;
@end
