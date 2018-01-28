//
//  TapViewController.m
//  iOS Gestures
//
//  Created by Eric Gregor on 2018-01-25.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@property (weak, nonatomic) IBOutlet UIView *colorView;

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.colorView.backgroundColor = [UIColor orangeColor];
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

- (IBAction)colorViewTapped:(id)sender {
    self.colorView.backgroundColor = [self.colorView.backgroundColor isEqual: [UIColor orangeColor]] ? [UIColor purpleColor] : [UIColor orangeColor];
}

@end
