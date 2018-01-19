//
//  ManagerAnchovies.m
//  PizzaRestaurant
//
//  Created by Eric Gregor on 2018-01-19.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ManagerAnchovies.h"

@implementation ManagerAnchovies

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    if ([toppings containsObject:@"anchovies"]) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen { 
    return NO;
}

@end
