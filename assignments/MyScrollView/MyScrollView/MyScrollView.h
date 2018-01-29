//
//  MyScrollView.h
//  MyScrollView
//
//  Created by Eric Gregor on 2018-01-29.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIView

@property (nonatomic) UIView *view;
@property (nonatomic) UIPanGestureRecognizer *panGesture;
@property (nonatomic) CGSize contentSize;
@property (nonatomic) NSMutableArray *rectangles;

- (instancetype)initWithView: (UIView *)view;
- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture;
- (void)addRectangle:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height color:(UIColor *)color;

@end
