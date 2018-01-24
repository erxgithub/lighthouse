//
//  City.m
//  Weather
//
//  Created by Eric Gregor on 2018-01-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithCityName: (NSString *)cityName withWeather:(NSString *)weather withImage:(UIImage *)image withTime:(NSDate *)time withTemperature:(NSInteger)temperature withPercentage:(NSInteger)percentage
{
    self = [super init];
    if (self) {
        _cityName = cityName;
        _weather = weather;
        _image = image;
        _time = time;
        _temperature = temperature;
        _percentage = percentage;
    }
    return self;
}

@end
