//
//  CustomView.m
//  FingerPaint
//
//  Created by Eric Gregor on 2018-01-26.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "CustomView.h"
#import "LineSegment.h"

@interface CustomView()

@property (nonatomic) NSMutableArray <LineSegment *>* line;

@end

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _line = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Touch Handling

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first secondPoint:first];
    [self.line addObject:segment];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint second = [touch locationInView:self];
    CGPoint first = [touch previousLocationInView:self];
    NSLog(@"%d: %@, %@", __LINE__, NSStringFromCGPoint(first), NSStringFromCGPoint(second));
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first secondPoint:second];
    [self.line addObject:segment];
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    UIColor *gray = [UIColor grayColor];
    [gray setStroke];
    for (LineSegment *segment in self.line) {
        if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {
            [path moveToPoint:segment.firstPoint];
            continue;
        }
        [path addLineToPoint:segment.firstPoint];
        [path addLineToPoint:segment.secondPoint];
    }
    [path stroke];
}

- (void)clear {
    [self.line removeAllObjects];
    [self setNeedsDisplay];
}

@end
