//
//  AdditionQuestion.m
//  Maths
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)init
{
    self = [super init];
    if (self) {
        int maxNumber = 100;
        int minNumber = 10;
        
        _leftValue = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;
        _rightValue = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;
        
        _startTime = [NSDate date];
    }
    return self;
}

// overriding getter
- (NSInteger)answer {
    _endTime = [NSDate date];
    return _answer;
}

- (NSTimeInterval)answerTime {
    return [self.endTime timeIntervalSinceDate:self.startTime];
}

- (void)generateQuestion {
    
}

@end
