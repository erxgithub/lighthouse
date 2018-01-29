//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Eric Gregor on 2018-01-29.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

- (instancetype)initWithView: (UIView *)view
{
    self = [super init];
    if (self) {
        _view = view;
        
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        [_view addGestureRecognizer:self.panGesture];
        _panGesture.enabled = YES;
        
        _rectangles = [[NSMutableArray alloc] init];
        
        _contentSize.width = 0.0;
        _contentSize.height = 0.0;

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture {
    // UIView *localView = [self.view hitTest:[gesture locationInView:gesture.view] withEvent:nil];
    // NSLog(@" TouchView = %@",localView);
    
    CGPoint translation = [gesture translationInView:self.view];
    CGRect bounds = self.view.bounds;
    
    // translate the view's bounds, but do not permit values that would violate contentSize
    
    CGFloat newBoundsOriginX = bounds.origin.x - translation.x;
    CGFloat minBoundsOriginX = 0.0;
    CGFloat maxBoundsOriginX = self.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX));
    
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    
    self.view.bounds = bounds;
    [gesture setTranslation:CGPointZero inView:self.view];
}

- (void)addRectangle:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height color:(UIColor *)color {
    UIView *rectangle = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    rectangle.backgroundColor = color;
    [self.view addSubview:rectangle];
    
    [self.rectangles addObject:rectangle];
    
    CGSize maxSize;
    maxSize.width = 0.0;
    maxSize.height = 0.0;
    
    CGFloat itemSizeX = 0.0;
    CGFloat itemSizeY = 0.0;

    for (UIView *item in self.rectangles) {
        itemSizeX = item.frame.origin.x + item.frame.size.width;
        if (itemSizeX > maxSize.width) {
            maxSize.width = itemSizeX;
        }

        itemSizeY = item.frame.origin.y + item.frame.size.height;
        if (itemSizeY > maxSize.height) {
            maxSize.height = itemSizeY;
        }
    }
    
    self.contentSize = maxSize;
 }

@end
