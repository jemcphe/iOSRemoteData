//
//  AssociateDetailViewController.h
//  Remote Data
//
//  Created by James McPherson on 10/24/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssociateDetailViewController : UIViewController
{
    // Define UI Elements
    IBOutlet UILabel* nameLabel;
    IBOutlet UILabel* phoneLabel;
    IBOutlet UILabel* emailLabel;
    IBOutlet UILabel* compLabel;
    IBOutlet UILabel* statusLabel;
    
    IBOutlet UIButton* editButton;
    IBOutlet UIButton* deleteButton;
}

// Define Global Strings that will hold data retrieved from previous ViewController
@property (strong, nonatomic) NSString* objectId;
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* phone;
@property (strong, nonatomic) NSString* email;
@property (strong, nonatomic) NSString* comp;
@property (strong, nonatomic) NSString* status;

// OnDelete & OnEdit Button Methods
-(IBAction)onDelete:(id)sender;

@end
