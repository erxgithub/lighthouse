//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithSize:(PizzaSize)size withToppings:(NSArray *)toppings
{
    self = [super init];
    if (self) {
        _size = size;
        _toppings = toppings;
    }
    return self;
}

- (NSString *)orderSize {
    return [self sizeToString];
}

- (NSArray *)orderToppings {
    return self.toppings;
}

- (NSString *)sizeToString {
    switch (self.size) {
        case PizzaSizeSmall:
            return @"small";
        case PizzaSizeMedium:
            return @"medium";
        default:
            return @"large";
    }
}

@end
