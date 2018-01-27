//
//  LineSegment.m
//  FingerPaint
//
//  Created by Eric Gregor on 2018-01-26.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "LineSegment.h"

@implementation LineSegment

- (instancetype)initWithFirstPoint:(CGPoint)first secondPoint:(CGPoint)second {
    if (self = [super init]) {
        _firstPoint = first;
        _secondPoint = second;
    }
    return self;
}

@end
