//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PizzaSize) {PizzaSizeSmall, PizzaSizeMedium, PizzaSizeLarge};

@interface Pizza : NSObject

@property (nonatomic, strong) NSString *size;
@property (nonatomic) NSMutableArray *toppings;

- (NSString *)pizzaSize;
- (NSArray *)pizzaToppings;

- (instancetype)initWithOrder:(NSArray *)order;

@end
