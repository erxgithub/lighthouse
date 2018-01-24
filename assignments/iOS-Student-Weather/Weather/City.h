//
//  City.h
//  Weather
//
//  Created by Eric Gregor on 2018-01-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic) NSString *cityName;
@property (nonatomic) NSString *weather;
@property (nonatomic) UIImage *image;
@property (nonatomic) NSDate *time;
@property (nonatomic) NSInteger temperature;
@property (nonatomic) NSInteger percentage;

- (instancetype)initWithCityName: (NSString *)cityName withWeather:(NSString *)weather withImage:(UIImage *)image withTime:(NSDate *)time withTemperature:(NSInteger)temperature withPercentage:(NSInteger)percentage;

@end
