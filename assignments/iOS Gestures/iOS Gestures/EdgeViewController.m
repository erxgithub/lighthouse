//
//  EdgeViewController.m
//  iOS Gestures
//
//  Created by Eric Gregor on 2018-01-27.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController () <UIGestureRecognizerDelegate>

@property (nonatomic) UIView *greenView;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *rightEdgeGesture;
@property (nonatomic) UIPanGestureRecognizer *panGesture;

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = 350;
    CGFloat height = 350;
    
    CGRect frame = CGRectMake(CGRectGetMaxX(self.view.bounds) - 10, CGRectGetMidY(self.view.bounds) - height / 2, width, height);
    
    self.greenView = [[UIView alloc] initWithFrame:frame];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    self.rightEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightEdgeGesture:)];
    self.rightEdgeGesture.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:self.rightEdgeGesture];
    self.rightEdgeGesture.enabled = YES;
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:self.panGesture];
    self.panGesture.enabled = NO;

}

- (void)handleRightEdgeGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
    // UIView *localView = [self.view hitTest:[gesture locationInView:gesture.view] withEvent:nil];
    // NSLog(@" TouchView = %@",localView);
    
    if (gesture.state == UIGestureRecognizerStateBegan ||
        gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:gesture.view];
            self.greenView.center = CGPointMake(self.view.bounds.size.width + (self.greenView.frame.size.width / 2) - 10 + translation.x, self.view.bounds.size.height / 2);

    }else {
        if (self.greenView.frame.origin.x > self.view.bounds.size.width - 100) {
            [UIView animateWithDuration:0.33 animations:^{
                self.greenView.center = CGPointMake(self.view.bounds.size.width + (self.greenView.frame.size.width / 2) - 10, self.view.bounds.size.height / 2);
            }];
        } else {
            self.greenView.center = CGPointMake(self.view.bounds.size.width - (self.greenView.frame.size.width / 2), self.view.bounds.size.height / 2);
            
            gesture.enabled = NO;
            self.panGesture.enabled = YES;
        }
    }
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture {
     // UIView *localView = [self.view hitTest:[gesture locationInView:gesture.view] withEvent:nil];
     // NSLog(@" TouchView = %@",localView);
    
    if (gesture.state == UIGestureRecognizerStateBegan ||
        gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:gesture.view];
        self.greenView.center = CGPointMake(self.view.bounds.size.width - (self.greenView.frame.size.width / 2) + translation.x, self.view.bounds.size.height / 2);

    }else {
        if (self.greenView.frame.origin.x < self.view.bounds.size.width - self.greenView.frame.size.width + 100) {
            [UIView animateWithDuration:0.33 animations:^{
                self.greenView.center = CGPointMake(self.view.bounds.size.width - (self.greenView.frame.size.width / 2), self.view.bounds.size.height / 2);
            }];
        } else {
            self.greenView.center = CGPointMake(self.view.bounds.size.width + (self.greenView.frame.size.width / 2) - 10, self.view.bounds.size.height / 2);
            
            gesture.enabled = NO;
            self.rightEdgeGesture.enabled = YES;
        }
    }
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
