//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"

@interface LPGViewController ()

@property (nonatomic) Pet *pet;
@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) UIImageView *bucketImageView;
@property (nonatomic) UIImageView *appleImageView;

@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    // pet
    
    self.pet = [[Pet alloc] init];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.petImageView.image = [UIImage imageNamed:@"default"];
    [self.view addSubview:self.petImageView];
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0
                                   constant:0.0].active = YES;

    // bucket
    
    self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.bucketImageView.image = [UIImage imageNamed:@"bucket"];
    [self.view addSubview:self.bucketImageView];
    
    [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:100.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:100.0].active = YES;

    [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0
                                  constant:0.0].active = YES;

    [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;

    // apple
    
    self.appleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.appleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.appleImageView.image = [UIImage imageNamed:@"apple"];
    [self.view addSubview:self.appleImageView];
    
    [NSLayoutConstraint constraintWithItem:self.appleImageView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleImageView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleImageView
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleImageView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:-50.0].active = YES;

    // gestures
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pannedImage:)];
    [self.petImageView addGestureRecognizer:panRecognizer];
    
    if (!self.petImageView.userInteractionEnabled) {
        self.petImageView.userInteractionEnabled = YES;
    }
    
    UILongPressGestureRecognizer *pressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressedImage:)];
    [self.appleImageView addGestureRecognizer:pressRecognizer];
    
    if (!self.appleImageView.userInteractionEnabled) {
        self.appleImageView.userInteractionEnabled = YES;
    }
}

- (void)pannedImage:(UIPanGestureRecognizer *)sender
{
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            //NSLog(@"start panning");
            break;
        case UIGestureRecognizerStateChanged:
            //NSLog(@"changed");
            break;
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"done panning");
            //NSLog(@"%@", NSStringFromCGPoint([sender velocityInView:self.view]));

            NSInteger velocity = (NSInteger)[sender velocityInView:self.view].x;
            [self.pet checkPettingVelocity:velocity];
            if (self.pet.grumpy) {
                self.petImageView.image = [UIImage imageNamed:@"grumpy"];
            } else {
                self.petImageView.image = [UIImage imageNamed:@"default"];
            }
        }

            break;
        default:
            break;
    }
}

- (IBAction)pressedImage:(UILongPressGestureRecognizer *)sender {
    NSLog(@"long pressed image");
    switch (sender.state){
        case UIGestureRecognizerStateBegan:
            //NSLog(@"started pressing image");
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint newLoc = [sender locationInView:sender.view.superview/*self.view*/];
            sender.view.center = newLoc;
            
            if(CGRectIntersectsRect([self.appleImageView frame], [self.petImageView frame])) {
                NSLog(@"overlap");
            }

        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGFloat petMinX = CGRectGetMinX(self.petImageView.frame);
            CGFloat petMaxX = CGRectGetMaxX(self.petImageView.frame);

            CGFloat appleMinX = CGRectGetMinX(self.appleImageView.frame);
            CGFloat appleMaxX = CGRectGetMaxX(self.appleImageView.frame);
            
            CGPoint newCenter;
            
            if (appleMinX > petMinX && appleMaxX < petMaxX && self.appleImageView.center.y < self.petImageView.center.y) {
                newCenter = CGPointMake(self.appleImageView.center.x,
                                        self.petImageView.center.y);
            } else {
                newCenter = CGPointMake(self.appleImageView.center.x,
                                        CGRectGetMaxY(self.view.frame) +
                                        CGRectGetHeight(self.appleImageView.frame));
            }

            [UIView animateWithDuration:1.5
             animations:^{
                 self.appleImageView.center = newCenter;
             }
             completion:^(BOOL finished) {
//                 [self.appleImageView removeFromSuperview];
//                 self.appleImageView = nil;

                 CGPoint newCenter = CGPointMake(CGRectGetWidth(self.appleImageView.frame) / 2,
                                                 CGRectGetMaxY(self.view.frame) - CGRectGetHeight(self.appleImageView.frame) -
                                                 (CGRectGetHeight(self.appleImageView.frame) / 2));
                 
                 self.appleImageView.center = newCenter;

             }];

        }
            break;
        default:
            break;
    }
}

@end
