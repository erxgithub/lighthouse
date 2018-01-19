//
//  Cook.h
//  Foodtruck
//
//  Created by Eric Gregor on 2018-01-19.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FoodTruck;

@protocol FoodTruckDelegate <NSObject>

-(double)foodTruck:(FoodTruck *)truck priceForFood:(NSString *)food;

@end

@interface Cook : NSObject

@end
