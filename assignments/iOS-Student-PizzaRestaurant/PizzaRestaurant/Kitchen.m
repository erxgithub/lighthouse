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

    if (self.kitchenDelegate != nil) {
        if (![self.kitchenDelegate kitchen:self shouldMakePizzaOfSize:pizzaSize andToppings:toppings]) {
            return nil;
        }
        
        if ([self.kitchenDelegate kitchenShouldUpgradeOrder:self]) {
            pizzaSize = PizzaSizeLarge;
        }
        
        
    }
 
    Pizza *pizza = [[Pizza alloc] initWithSize:pizzaSize withToppings:toppings];

    if ([self.kitchenDelegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
        [self.kitchenDelegate kitchenDidMakePizza:pizza];
     }

    return pizza;
}

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    int maxNumber = 1;
    int minNumber = 0;
    
    NSInteger canProcess = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;
    
    if (canProcess == 1) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    int maxNumber = 1;
    int minNumber = 0;
    
    NSInteger canProcess = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;
    
    if (canProcess == 1) {
        return YES;
    } else {
        return NO;
    }
}

- (void)kitchenDidMakePizza:(Pizza *)pizza {

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
