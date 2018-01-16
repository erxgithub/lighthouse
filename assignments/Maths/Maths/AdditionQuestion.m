//
//  AdditionQuestion.m
//  Maths
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion

- (instancetype)init
{
    self = [super init];
    if (self) {
        // random numbers between 10 and 100
        NSInteger number1 = 10 + arc4random_uniform(90);
        NSInteger number2 = 10 + arc4random_uniform(90);
        
        _question = [NSString stringWithFormat:@"%@%@%@%@", [NSString stringWithFormat:@"%ld", number1],  @" + " ,[NSString stringWithFormat:@"%ld", number2], @" = ?"];
        
        _answer = number1 + number2;

    }
    return self;
}

@end
