//
//  AnotherCook.m
//  Foodtruck
//
//  Created by Eric Gregor on 2018-01-21.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "AnotherCook.h"

@implementation AnotherCook

-(double)foodTruck:(FoodTruck *)truck priceForFood:(NSString *)food {
    if ([food  isEqual: @"boa"]) {
        return 3;
    } else if ([food  isEqual: @"shortbread"]) {
        return 7;
    } else {
        return 5;
    }
}

@end
