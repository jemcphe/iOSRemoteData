//
//  Associate.m
//  Remote Data
//
//  Created by James McPherson on 10/21/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import "Associate.h"

@implementation Associate
// Get Object Id
-(NSString*)getObjectId{
    return objectId;
}
// Set Object Id
-(void)setObjectId:(NSString *)objectIdString{
    objectId = objectIdString;
}
// Get First Name
-(NSString*)getFirstName{
    return firstName;
}
// Set First Name
-(void)setFirstName:(NSString *)firstNameString{
    firstName = firstNameString;
}
// Get Last Name
-(NSString*)getLastName{
    return lastName;
}
// Set Last Name
-(void)setLastName:(NSString *)lastNameString{
    lastName = lastNameString;
}
// Get Phone
-(NSString*)getPhone{
    return phone;
}
// Set Phone
-(void)setPhone:(NSString *)phoneString{
    phone = phoneString;
}
// Get Email
-(NSString*)getEmail{
    return email;
}
// Set Email
-(void)setEmail:(NSString *)emailString{
    email = emailString;
}
// Get CompId
-(NSString*)getCompId{
    return compId;
}
// Set CompId
-(void)setCompId:(NSString *)compIdString{
    compId = compIdString;
}
// Get Status
-(NSString*)getStatus{
    return status;
}
// Set Status
-(void)setStatus:(NSString *)statusString{
    status = statusString;
}
@end
