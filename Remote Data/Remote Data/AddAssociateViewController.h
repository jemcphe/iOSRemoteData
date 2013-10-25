//
//  AddAssociateViewController.h
//  Remote Data
//
//  Created by James McPherson on 10/22/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AddAssociateViewController : UIViewController <UITextFieldDelegate>
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
    
    // Create Parse Object
    PFObject* associate;
    
}

// Method for when associate is added to database
-(IBAction)onAddAssociate:(id)sender;

@end
