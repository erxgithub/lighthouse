//
//  LHWAppDelegate.m
//  Weather
//
//  Created by Steven Masuch on 2014-07-30.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHWAppDelegate.h"
#import "City.h"
#import "CityViewController.h"

@implementation LHWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // Your code goes here
    // Don't forget to assign the window a rootViewController
    
    City *vancouver = [[City alloc] initWithCityName:@"Vancouver" withWeather:@"Rain" withImage:[UIImage imageNamed:@"rain.png"] withTime:[NSDate date] withTemperature:10 withPercentage:100];
    City *newYork = [[City alloc] initWithCityName:@"New York" withWeather:@"Cloudy" withImage:[UIImage imageNamed:@"cloudy.png"] withTime:[NSDate date] withTemperature:0 withPercentage:10];
    City *london = [[City alloc] initWithCityName:@"London" withWeather:@"Fog" withImage:[UIImage imageNamed:@"fog.png"] withTime:[NSDate date] withTemperature:5 withPercentage:100];
    City *paris = [[City alloc] initWithCityName:@"Paris" withWeather:@"Snow" withImage:[UIImage imageNamed:@"snow.png"] withTime:[NSDate date] withTemperature:-10 withPercentage:100];
    City *rome = [[City alloc] initWithCityName:@"Rome" withWeather:@"Sunny" withImage:[UIImage imageNamed:@"Sunny.png"] withTime:[NSDate date] withTemperature:25 withPercentage:0];

    // Vancouver
    CityViewController *vancouverViewController = [[CityViewController alloc] initWithCity:vancouver];
    UINavigationController *vancouverNavigationController = [[UINavigationController alloc] initWithRootViewController:vancouverViewController];
    
    // New York
    CityViewController *newYorkViewController = [[CityViewController alloc] initWithCity:newYork];
    UINavigationController *newYorkNavigationController = [[UINavigationController alloc] initWithRootViewController:newYorkViewController];
    
    // London
    CityViewController *londonViewController = [[CityViewController alloc] initWithCity:london];
    UINavigationController *londonNavigationController = [[UINavigationController alloc] initWithRootViewController:londonViewController];
    
    // Paris
    CityViewController *parisViewController = [[CityViewController alloc] initWithCity:paris];
    UINavigationController *parisNavigationController = [[UINavigationController alloc] initWithRootViewController:parisViewController];
    
    // Rome
    CityViewController *romeViewController = [[CityViewController alloc] initWithCity:rome];
    UINavigationController *romeNavigationController = [[UINavigationController alloc] initWithRootViewController:romeViewController];
    
    // tab bar controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[vancouverNavigationController, newYorkNavigationController, londonNavigationController, parisNavigationController, romeNavigationController];
    [self.window setRootViewController:tabBarController];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
