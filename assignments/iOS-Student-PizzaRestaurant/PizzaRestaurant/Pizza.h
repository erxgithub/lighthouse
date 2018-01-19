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

@property (nonatomic) PizzaSize size;
@property (nonatomic) NSArray *toppings;

- (NSString *)orderSize;
- (NSArray *)orderToppings;
- (NSString *)sizeToString;

- (instancetype)initWithSize:(PizzaSize)size withToppings:(NSArray *)toppings;

@end
