//
//  Associate.h
//  Remote Data
//
//  Created by James McPherson on 10/21/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Associate : NSObject
{
    // String values
    NSString* objectId;
    NSString* firstName;
    NSString* lastName;
    NSString* phone;
    NSString* email;
    NSString* compId;
    NSString* status;
}
// Declaring custom getters & setters
- (NSString*)getObjectId;
- (void) setObjectId: (NSString*) objectIdString;

- (NSString*)getFirstName;
- (void) setFirstName: (NSString*) firstNameString;

- (NSString*)getLastName;
- (void) setLastName: (NSString*) lastNameString;

- (NSString*)getPhone;
- (void) setPhone: (NSString*) phoneString;

- (NSString*)getEmail;
- (void) setEmail: (NSString*) emailString;

- (NSString*)getCompId;
- (void) setCompId: (NSString*) compIdString;

- (NSString*)getStatus;
- (void) setStatus: (NSString*) statusString;
@end
