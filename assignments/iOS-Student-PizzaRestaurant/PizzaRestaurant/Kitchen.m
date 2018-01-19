//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(NSString *)size toppings:(NSArray *)toppings
{
    PizzaSize pizzaSize = [self sizeStringToSize:size];
    return [[Pizza alloc] initWithSize:pizzaSize withToppings:toppings];
}

- (PizzaSize)sizeStringToSize:(NSString *)size {
    if ([size.lowercaseString isEqualToString:@"small"]) {
        return PizzaSizeSmall;
    } else if ([size.lowercaseString isEqualToString:@"medium"]) {
        return PizzaSizeMedium;
    } else {
        return PizzaSizeLarge;
    }
}

@end
