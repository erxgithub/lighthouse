//
//  Contact.m
//  Contact List
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithName:(NSString *)fullName email:(NSString *)email {
    self = [super init];
    if (self) {
        self.fullName = fullName;
        self.email = email;
    }
    return self;
}

@end
