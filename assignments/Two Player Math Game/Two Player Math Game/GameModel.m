//
//  GameModel.m
//  Two Player Math Game
//
//  Created by Eric Gregor on 2018-01-22.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerNo = 1;
        [self generateQuestion];
    }
    return self;
}

- (void)generateQuestion {
    int maxNumber = 20;
    int minNumber = 1;
    
    NSInteger leftValue = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;
    NSInteger rightValue = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;
    
    self.question = [NSString stringWithFormat:@"%@%@%@%@", [NSString stringWithFormat:@"%ld", leftValue],  @" + " ,[NSString stringWithFormat:@"%ld", rightValue], @" = ?"];
    
    self.answer = leftValue + rightValue;
}

- (void)switchPlayer {
    if (self.playerNo == 1) {
        self.playerNo = 2;
    } else {
        self.playerNo = 1;
    }
}

@end
