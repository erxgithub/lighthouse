//
//  ManagerCheery.m
//  PizzaRestaurant
//
//  Created by Eric Gregor on 2018-01-19.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ManagerCheery.h"

@implementation ManagerCheery

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings { 
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen { 
    return YES;
}

- (void)kitchenDidMakePizza:(Pizza *)pizza {
    NSLog(@"Have a nice day!");
}

@end
