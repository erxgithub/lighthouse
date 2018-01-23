//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"
#import "NSLayoutConstraint+EvenDistribution.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@property (nonatomic, weak) UIView *purpleBox;
@property (nonatomic, weak) NSLayoutConstraint *purpleBoxHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *purpleBoxWidthConstraint;

@property (nonatomic, weak) UIView *redBox;
@property (nonatomic, weak) NSLayoutConstraint *redBoxHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *redBoxWidthConstraint;

@property (nonatomic, weak) UIView *orangeBox1;
@property (nonatomic, weak) NSLayoutConstraint *orangeBoxHeightConstraint1;
@property (nonatomic, weak) NSLayoutConstraint *orangeBoxWidthConstraint1;
@property (nonatomic, weak) NSLayoutConstraint *orangeBoxCenterY1;

@property (nonatomic, weak) UIView *orangeBox2;
@property (nonatomic, weak) NSLayoutConstraint *orangeBoxHeightConstraint2;
@property (nonatomic, weak) NSLayoutConstraint *orangeBoxWidthConstraint2;
@property (nonatomic, weak) NSLayoutConstraint *orangeBoxCenterY2;

@property (nonatomic, weak) UIView *blueBox1;
@property (nonatomic, weak) NSLayoutConstraint *blueBoxHeightConstraint1;
@property (nonatomic, weak) NSLayoutConstraint *blueBoxWidthConstraint1;
@property (nonatomic, weak) NSLayoutConstraint *blueBoxCenterX1;

@property (nonatomic, weak) UIView *blueBox2;
@property (nonatomic, weak) NSLayoutConstraint *blueBoxHeightConstraint2;
@property (nonatomic, weak) NSLayoutConstraint *blueBoxWidthConstraint2;
@property (nonatomic, weak) NSLayoutConstraint *blueBoxCenterX2;

@property (nonatomic, weak) UIView *blueBox3;
@property (nonatomic, weak) NSLayoutConstraint *blueBoxHeightConstraint3;
@property (nonatomic, weak) NSLayoutConstraint *blueBoxWidthConstraint3;
@property (nonatomic, weak) NSLayoutConstraint *blueBoxCenterX3;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:500.0];
    self.framingViewWidthConstraint.active = YES;
    
    // Set up your views and constraints here
    
    // purple box
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleBox];
    self.purpleBox = purpleBox;
    
    NSLayoutConstraint *purpleBoxBottomConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:-20];
    [self.framingView addConstraint:purpleBoxBottomConstraint];
    
    NSLayoutConstraint *purpleBoxRightConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRightMargin multiplier:1 constant:-20];
    [self.framingView addConstraint:purpleBoxRightConstraint];

    self.purpleBoxHeightConstraint = [NSLayoutConstraint constraintWithItem:purpleBox                                                        attribute:NSLayoutAttributeHeight                                                           relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute                                        multiplier:1.0 constant:50.0];
    self.purpleBoxHeightConstraint.active = YES;

    self.purpleBoxWidthConstraint = [NSLayoutConstraint constraintWithItem:purpleBox                                                                    attribute:NSLayoutAttributeWidth                                                              relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeWidth multiplier:305.0/500.0 constant:0.0];
    self.purpleBoxWidthConstraint.active = YES;
    
    // red box
    
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redBox];
    self.redBox = redBox;
    
    NSLayoutConstraint *redBoxTopConstraint = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTopMargin multiplier:1 constant:20];
    [self.framingView addConstraint:redBoxTopConstraint];
    
    NSLayoutConstraint *redBoxRightConstraint = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRightMargin multiplier:1 constant:-20];
    [self.framingView addConstraint:redBoxRightConstraint];
    
    self.redBoxHeightConstraint = [NSLayoutConstraint constraintWithItem:redBox                                                                   attribute:NSLayoutAttributeHeight                                                            relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute                                                           multiplier:1.0 constant:50.0];
    self.redBoxHeightConstraint.active = YES;

    self.redBoxWidthConstraint = [NSLayoutConstraint constraintWithItem:redBox                                                                    attribute:NSLayoutAttributeWidth                                                              relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:156.0];
    self.redBoxWidthConstraint.active = YES;
    
    // orange box 1
    
    UIView *orangeBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox1.backgroundColor = [UIColor orangeColor];
    [self.redBox addSubview:orangeBox1];
    self.orangeBox1 = orangeBox1;
    
    self.orangeBoxCenterY1 = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    self.orangeBoxCenterY1.active = YES;

    NSLayoutConstraint *orangeBoxLeftConstraint1 = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeLeftMargin multiplier:1 constant:4];
    [self.redBox addConstraint:orangeBoxLeftConstraint1];
    
    self.orangeBoxHeightConstraint1 = [NSLayoutConstraint constraintWithItem:orangeBox1                                                                   attribute:NSLayoutAttributeHeight                                                            relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute                                                           multiplier:1.0 constant:30.0];
    self.orangeBoxHeightConstraint1.active = YES;
    
    self.orangeBoxWidthConstraint1 = [NSLayoutConstraint constraintWithItem:orangeBox1                                                                    attribute:NSLayoutAttributeWidth                                                              relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:70.0];
    self.orangeBoxWidthConstraint1.active = YES;
    
    // orange box 2
    
    UIView *orangeBox2 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox2.backgroundColor = [UIColor orangeColor];
    [self.redBox addSubview:orangeBox2];
    self.orangeBox2 = orangeBox2;
    
    self.orangeBoxCenterY2 = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    self.orangeBoxCenterY2.active = YES;

    NSLayoutConstraint *orangeBoxRightConstraint2 = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeRightMargin multiplier:1 constant:-4];
    [self.redBox addConstraint:orangeBoxRightConstraint2];
    
    self.orangeBoxHeightConstraint2 = [NSLayoutConstraint constraintWithItem:orangeBox2                                                                   attribute:NSLayoutAttributeHeight                                                            relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute                                                             multiplier:1.0 constant:30.0];
    self.orangeBoxHeightConstraint2.active = YES;
    
    self.orangeBoxWidthConstraint2 = [NSLayoutConstraint constraintWithItem:orangeBox2                                                                    attribute:NSLayoutAttributeWidth                                                              relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];
    self.orangeBoxWidthConstraint2.active = YES;
    
    // blue box 1
    
    UIView *blueBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox1.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox1];
    self.blueBox1 = blueBox1;
    
    self.blueBoxCenterX1 = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    self.blueBoxCenterX1.active = YES;
    
    self.blueBoxHeightConstraint1 = [NSLayoutConstraint constraintWithItem:blueBox1                                                                  attribute:NSLayoutAttributeHeight                                                         relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute                                                             multiplier:1.0 constant:50.0];
    self.blueBoxHeightConstraint1.active = YES;
    
    self.blueBoxWidthConstraint1 = [NSLayoutConstraint constraintWithItem:blueBox1                                                                    attribute:NSLayoutAttributeWidth                                                              relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];
    self.blueBoxWidthConstraint1.active = YES;

    // blue box 2
    
    UIView *blueBox2 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox2.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox2.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox2];
    self.blueBox2 = blueBox2;
    
    self.blueBoxCenterX2 = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    self.blueBoxCenterX2.active = YES;

    self.blueBoxHeightConstraint2 = [NSLayoutConstraint constraintWithItem:blueBox2                                                                  attribute:NSLayoutAttributeHeight                                                         relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute                                                             multiplier:1.0 constant:50.0];
    self.blueBoxHeightConstraint2.active = YES;
    
    self.blueBoxWidthConstraint2 = [NSLayoutConstraint constraintWithItem:blueBox2                                                                    attribute:NSLayoutAttributeWidth                                                              relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];
    self.blueBoxWidthConstraint2.active = YES;

    // blue box 3
    
    UIView *blueBox3 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox3.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox3.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox3];
    self.blueBox2 = blueBox3;
    
    self.blueBoxCenterX3 = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    self.blueBoxCenterX3.active = YES;

    self.blueBoxHeightConstraint3 = [NSLayoutConstraint constraintWithItem:blueBox3                                                                  attribute:NSLayoutAttributeHeight                                                         relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute                                                             multiplier:1.0 constant:50.0];
    self.blueBoxHeightConstraint3.active = YES;
    
    self.blueBoxWidthConstraint3 = [NSLayoutConstraint constraintWithItem:blueBox3                                                                    attribute:NSLayoutAttributeWidth                                                              relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];
    self.blueBoxWidthConstraint3.active = YES;
    
    // space the blue boxes evenly along the vertical axis
    
    NSArray *constraints = [NSLayoutConstraint constraintsForEvenDistributionOfItems:@[blueBox1, blueBox2, blueBox3] relativeToCenterOfItem:self.framingView vertically:YES];
    [self.framingView addConstraints:constraints];
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
