//
//  CityViewController.h
//  Weather
//
//  Created by Eric Gregor on 2018-01-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface CityViewController : UIViewController

@property (nonatomic) City *city;

- (void)showWeatherDetails;
- (instancetype)initWithCity: (City *)city;

@end
