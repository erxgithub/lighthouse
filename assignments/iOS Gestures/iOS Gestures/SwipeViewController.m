//
//  SwipeViewController.m
//  iOS Gestures
//
//  Created by Eric Gregor on 2018-01-27.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet UIView *brownView;

@property (nonatomic) BOOL open;

-(void)slideRight:(UISwipeGestureRecognizer *)gestureRecognizer;
-(void)slideLeft:(UISwipeGestureRecognizer *)gestureRecognizer;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISwipeGestureRecognizer *swipeLeftWhite = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideLeft:)];
    swipeLeftWhite.direction = UISwipeGestureRecognizerDirectionLeft;

    UISwipeGestureRecognizer *swipeRightWhite = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideRight:)];
    swipeRightWhite.direction = UISwipeGestureRecognizerDirectionRight;

    [self.brownView addGestureRecognizer:swipeLeftWhite];
    [self.brownView addGestureRecognizer:swipeRightWhite];
    
    self.open = NO;
}

-(void)slideLeft:(UISwipeGestureRecognizer *)gestureRecognizer{
    if (!self.open) {
        [UIView animateWithDuration:0.5 animations:^{
            CGFloat offset = self.whiteView.frame.size.width * -0.25;
            self.whiteView.frame = CGRectOffset(self.whiteView.frame, offset, 0.0);
        }];

        self.open = YES;
    }
}

-(void)slideRight:(UISwipeGestureRecognizer *)gestureRecognizer{
    if (self.open) {
        [UIView animateWithDuration:0.5 animations:^{
            CGFloat offset = self.whiteView.frame.size.width * 0.25;
            self.whiteView.frame = CGRectOffset(self.whiteView.frame, offset, 0.0);
        }];
        
        self.open = NO;
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
