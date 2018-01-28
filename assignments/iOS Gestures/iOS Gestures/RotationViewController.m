//
//  RotationViewController.m
//  iOS Gestures
//
//  Created by Eric Gregor on 2018-01-27.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

-(void)handleRotation:(UIRotationGestureRecognizer *)rotationGestureRecognizer;

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    [self.redView addGestureRecognizer:rotationGestureRecognizer];
}

-(void)handleRotation:(UIRotationGestureRecognizer *)rotationGestureRecognizer{
    self.redView.transform = CGAffineTransformRotate(self.redView.transform, rotationGestureRecognizer.rotation);
    
    rotationGestureRecognizer.rotation = 0.0;
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

@end
