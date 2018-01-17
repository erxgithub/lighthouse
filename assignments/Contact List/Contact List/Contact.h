//
//  Contact.h
//  Contact List
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property NSString *fullName;
@property NSString *email;

- (instancetype)initWithName:(NSString *)fullName email:(NSString *)email;

@end
