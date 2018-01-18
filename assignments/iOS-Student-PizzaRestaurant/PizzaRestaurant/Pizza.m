//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

@synthesize size;
@synthesize toppings;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithOrder:(NSArray *)order
{
    self = [super init];
    if (self) {
        size = @"";
        toppings = [[NSMutableArray alloc] init];

        for (NSString *item in order) {
            if ([item  isEqual: @"small"]) {
                size = item;
            } else {
                [toppings addObject:item];
            }
        }
    }
    return self;
}

- (NSString *)pizzaSize {
    return size;
}

- (NSArray *)pizzaToppings {
    return [NSArray arrayWithArray:toppings];
}

@end
