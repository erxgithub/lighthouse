//
//  DivisionQuestion.m
//  Maths
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "DivisionQuestion.h"

@implementation DivisionQuestion

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generateQuestion];
    }
    return self;
}

- (void)generateQuestion {
    NSInteger number1 = super.leftValue;
    NSInteger number2 = super.rightValue;
    
    super.question = [NSString stringWithFormat:@"%@%@%@%@", [NSString stringWithFormat:@"%ld", number1],  @" / " ,[NSString stringWithFormat:@"%ld", number2], @" = ?"];
    
    super.answer = number1 / number2;
}

@end
