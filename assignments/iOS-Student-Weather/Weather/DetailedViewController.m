//
//  DetailedViewController.m
//  Weather
//
//  Created by Eric Gregor on 2018-01-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController

- (instancetype)initWithCity: (City *)city
{
    self = [super init];
    if (self) {
        _city = city;
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

- (void)addViewItems {
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 150, 300, 20)];
    label1.text = @"Time: ";
    label1.textColor = [UIColor whiteColor];
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(150, 150, 300, 20)];
    label2.text = [NSString stringWithFormat:@"%@", self.city.time];
    label2.textColor = [UIColor whiteColor];
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(40, 180, 300, 20)];
    label3.text = @"Temperature: ";
    label3.textColor = [UIColor whiteColor];
    [self.view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(150, 180, 300, 20)];
    label4.text = [NSString stringWithFormat:@"%ld%@", (long)self.city.temperature, @"\u00B0"];
    label4.textColor = [UIColor whiteColor];
    [self.view addSubview:label4];
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(40, 210, 300, 20)];
    label5.text = @"Percentage: ";
    label5.textColor = [UIColor whiteColor];
    [self.view addSubview:label5];

    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(150, 210, 300, 20)];
    label6.text = [NSString stringWithFormat:@"%ld%%", (long)self.city.percentage];
    label6.textColor = [UIColor whiteColor];
    [self.view addSubview:label6];
}

@end
