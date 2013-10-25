//
//  EditAssociateViewController.m
//  Remote Data
//
//  Created by James McPherson on 10/24/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import "EditAssociateViewController.h"

@interface EditAssociateViewController ()

@end

@implementation EditAssociateViewController

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
    
    // Set Values of TextFields to passed Data
    [firstNameField setText:firstName];
    lastNameField.text = lastName;
    phoneField.text = phone;
    emailField.text = email;
    compField.text = comp;
    statusField.text = status;
        
    // Keyboard observers
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

- (void)keyboardWasShown:(NSNotification *)notification
{
    // Step 1: Get the size of the keyboard.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    // Step 2: Adjust the bottom content inset of your scroll view by the keyboard height.
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    // Step 3: Scroll the target text field into view.
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y - (keyboardSize.height-15));
        [scrollView setContentOffset:scrollPoint animated:YES];
    }
}

- (void) keyboardWillHide:(NSNotification *)notification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}

// OnUpdate Method
-(IBAction)onUpdate:(id)sender{
    // Create query that parses through Associate Table in Database
    PFQuery* query = [PFQuery queryWithClassName:@"Associate"];
    // Retrieve objects from Associate Table and pass in a specific ObjectId for data requested
    [query getObjectInBackgroundWithId:objectId block:^(PFObject *associate, NSError *error) {
        // Place value of textfields into associate object & save to database
        associate[@"firstName"] = firstNameField.text;
        associate[@"lastName"] = lastNameField.text;
        associate[@"phoneNumber"] = phoneField.text;
        associate[@"email"] = emailField.text;
        associate[@"compId"] = compField.text;
        associate[@"status"] = statusField.text;
        // Save Associate... if offline, saveEventually will allow for, when data connection is available, saving new data
        [associate saveEventually];
    }];
    // Navigate back to Root View Controller
    [self.navigationController popToRootViewControllerAnimated:TRUE];
    
}

@end
