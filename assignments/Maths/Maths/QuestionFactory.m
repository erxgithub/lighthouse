//
//  QuestionFactory.m
//  Maths
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "QuestionFactory.h"

@implementation QuestionFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questionSubclassNames = @[@"AdditionQuestion", @"SubtractionQuestion", @"MultiplicationQuestion", @"DivisionQuestion"];
    }
    return self;
}

- (Question *)generateRandomQuestion {
    NSString *className = [self.questionSubclassNames objectAtIndex:arc4random_uniform(4)];
    return [[NSClassFromString(className) alloc]init];
}

@end
