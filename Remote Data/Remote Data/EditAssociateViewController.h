//
//  EditAssociateViewController.h
//  Remote Data
//
//  Created by James McPherson on 10/24/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditAssociateViewController : UIViewController
{
    // Define UI Elements
    IBOutlet UITextField* firstNameField;
    IBOutlet UITextField* lastNameField;
    IBOutlet UITextField* phoneField;
    IBOutlet UITextField* emailField;
    IBOutlet UITextField* compField;
    IBOutlet UITextField* statusField;
    
    UITextField* activeField;
    
    IBOutlet UIButton* addButton;
    
    IBOutlet UIScrollView* scrollView;
        
}

// global Strings for holding passed in data
@property (strong, nonatomic) NSString* objectId;
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* phone;
@property (strong, nonatomic) NSString* email;
@property (strong, nonatomic) NSString* comp;
@property (strong, nonatomic) NSString* status;

// OnUpdate Function
-(IBAction)onUpdate:(id)sender;
@end
