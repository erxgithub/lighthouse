//
//  CustomViewController.m
//  MyScrollView
//
//  Created by Eric Gregor on 2018-01-29.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@property (nonatomic) MyScrollView *scrollView;

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView = [[MyScrollView alloc] initWithView:self.view];

    [self.scrollView addRectangle:20 y:20 width:100 height:100 color:[UIColor redColor]];
    [self.scrollView addRectangle:150 y:150 width:150 height:200 color:[UIColor greenColor]];
    [self.scrollView addRectangle:40 y:400 width:200 height:150 color:[UIColor blueColor]];
    [self.scrollView addRectangle:100 y:600 width:180 height:150 color:[UIColor yellowColor]];

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

- (void)viewDidAppear:(BOOL)animated {
//    CGRect bounds = self.view.bounds;
//    bounds.origin.y = bounds.origin.y + 100.0;
//    self.view.bounds = bounds;
}

@end
