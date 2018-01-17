//
//  Dice.m
//  Threelow
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentValue = 0;
        _hold = 0;
    }
    return self;
}

- (void)randomize {
    int maxNumber = 6;
    int minNumber = 1;
    
    self.currentValue = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;
}

@end
