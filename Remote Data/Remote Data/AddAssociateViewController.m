//
//  AddAssociateViewController.m
//  Remote Data
//
//  Created by James McPherson on 10/22/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import "AddAssociateViewController.h"

@interface AddAssociateViewController ()

@end

@implementation AddAssociateViewController

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
    // Do any additional setup after loading the view from its nib.
    
    // Insert Data into TextFields for testing
//    [firstNameField setText:@"Marty"];
//    [lastNameField setText:@"Huggins"];
//    [phoneField setText:@"555-555-7777"];
//    [emailField setText:@"huggins4pres@gmail.com"];
//    [compField setText:@"77777"];
//    [statusField setText:@"Part Time"];
    
    
    // Add Observers for the keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onAddAssociate:(id)sender{
    //Create a PFObject for the Associate Table on Parse.com
    associate = [PFObject objectWithClassName:@"Associate"];
    // Log TextFields
    NSLog(@"%@, %@, %@, %@, %@, %@", firstNameField.text, lastNameField.text, phoneField.text, emailField.text, compField.text, statusField.text);
    
    //Insert objects into database
    associate[@"firstName"] = firstNameField.text;
    associate[@"lastName"] = lastNameField.text;
    associate[@"phoneNumber"] = phoneField.text;
    associate[@"email"] = emailField.text;
    associate[@"compId"] = compField.text;
    associate[@"status"] = statusField.text;
    // Save the Associate to the database... if offline, when data connection resumes
    [associate saveEventually];
    
    // dismiss the modal view and go back to ViewController
    [self dismissViewControllerAnimated:TRUE completion:NULL];
}


// When keyboard is shown
- (void)keyboardWasShown:(NSNotification *)notification
{
    // Get the size of the keyboard.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    // Adjust the bottom content inset of your scroll view by the keyboard height.
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    // Scroll the target text field into view.
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y - (keyboardSize.height-15));
        [scrollView setContentOffset:scrollPoint animated:YES];
    }
}

// Hide Keyboard
- (void) keyboardWillHide:(NSNotification *)notification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}

@end
