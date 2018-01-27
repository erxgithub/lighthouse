//
//  LineSegment.h
//  FingerPaint
//
//  Created by Eric Gregor on 2018-01-26.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

@import UIKit;

@interface LineSegment : NSObject

@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint secondPoint;

- (instancetype)initWithFirstPoint:(CGPoint)first secondPoint:(CGPoint)second;

@end
