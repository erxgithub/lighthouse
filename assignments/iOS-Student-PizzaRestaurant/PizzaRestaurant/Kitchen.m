//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

PizzaSize sizeStringToSize(NSString *size) {
    if ([size.lowercaseString isEqualToString:@"small"]) {
        return PizzaSizeSmall;
    } else if ([size.lowercaseString isEqualToString:@"medium"]) {
        return PizzaSizeMedium;
    } else {
        return PizzaSizeLarge;

    }
}

NSString *sizeToString(PizzaSize size) {
    switch (size) {
        case PizzaSizeSmall:
            return @"small";
        case PizzaSizeMedium:
            return @"medium";
        default:
            return @"large";
    }
}

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
{
    //return [[Pizza alloc] initWithOrder:<#(NSArray *)#>]
}

@end
