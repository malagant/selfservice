//
//  RegistrationDTO.h
//  SelfService
//
//  Created by Michael Johann on 02.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegistrationDTO : NSObject {
    NSString *_firstName;
    NSString *_lastName;
    NSString *_email;
    NSString *_password;
    NSString *_passwordConfirmation;
}

@property(nonatomic, copy) NSString *firstName;
@property(nonatomic, copy) NSString *lastName;
@property(nonatomic, copy) NSString *email;
@property(nonatomic, copy) NSString *password;
@property(nonatomic, copy) NSString *passwordConfirmation;

+(void)initMapping:(RKObjectManager *)manager;

@end
