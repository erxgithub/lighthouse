//
//  CityViewController.m
//  Weather
//
//  Created by Eric Gregor on 2018-01-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "CityViewController.h"
#import "DetailedViewController.h"
#import "City.h"

@interface CityViewController ()

@end

@implementation CityViewController

- (instancetype) initWithCity: (City *)city
{
    self = [super init];
    if (self) {
        _city = city;
        self.title = city.cityName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addViewItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)showWeatherDetails {
    DetailedViewController *detailedViewController = [[DetailedViewController alloc] initWithCity:self.city];
    [self.navigationController pushViewController:detailedViewController animated:YES];
    
}

- (void)addViewItems {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(showWeatherDetails) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show Details" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 150, 300, 20)];
    label.text = self.city.weather;
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 150, 50, 50)];
    imageView.image = self.city.image;
    
    [self.view addSubview:imageView];
}

@end
