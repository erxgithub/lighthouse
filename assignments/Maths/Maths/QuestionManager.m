//
//  QuestionManager.m
//  Maths
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "QuestionManager.h"

@implementation QuestionManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questions = [[NSMutableArray alloc] init];
        _totalTime = 0;
    }
    return self;
}

- (NSString *)timeOutput {
    NSTimeInterval averageTime = self.totalTime / [self.questions count];
    
    NSString *output = [NSString stringWithFormat:@"total time: %@s, average time: %@s", [NSString     stringWithFormat:@"%.0f", ceil(self.totalTime)], [NSString stringWithFormat:@"%.0f", ceil(averageTime)]];

    return output;
}

@end
