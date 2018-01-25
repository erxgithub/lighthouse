//
//  Pet.m
//  Phonagotchi
//
//  Created by Eric Gregor on 2018-01-25.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@interface Pet ()

@end

@implementation Pet

- (instancetype)init
{
    self = [super init];
    if (self) {
        _grumpy = NO;
    }
    return self;
}

- (void)checkPettingVelocity:(NSInteger)velocity {
    if (velocity > 200) {
        _grumpy = YES;
    } else {
        _grumpy = NO;
    }
}

@end
