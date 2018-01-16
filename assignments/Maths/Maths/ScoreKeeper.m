//
//  ScoreKeeper.m
//  Maths
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "ScoreKeeper.h"

@implementation ScoreKeeper

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rightCount = 0;
        _wrongCount = 0;
    }
    return self;
}

- (void)printScore {
    NSInteger percent = (float)self.rightCount / ((float)self.rightCount + (float)self.wrongCount) * 100;
    NSLog(@"score: %ld right, %ld wrong ---- %ld%%", (long)self.rightCount, (long)self.wrongCount, (long)percent);
}

@end
