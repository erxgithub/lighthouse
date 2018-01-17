//
//  GameController.m
//  Threelow
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _diceCollection = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 5; i++) {
            [_diceCollection addObject:[[Dice alloc] init]];
        }
    }
    return self;
}

- (void)rollDice: (int) mode {
    if (mode == 1) {
        for (int i = 0; i < 5; i++) {
            self.diceCollection[i].currentValue = 3;
            self.diceCollection[i].hold = 1;
        }
    } else {
        for (int i = 0; i < 5; i++) {
            if (self.diceCollection[i].hold == 0) {
                [self.diceCollection[i] randomize];
            }
        }
    }
}

- (void)holdDice: (int) number {
    if (number >= 1 && number <= 5) {
        if (self.diceCollection[number - 1].hold == 0) {
            self.diceCollection[number - 1].hold = 1;
        } else {
            self.diceCollection[number - 1].hold = 0;
        }
    }
}

- (void)resetDice {
    for (int i = 0; i < 5; i++) {
        self.diceCollection[i].hold = 0;
    }
}

- (NSString *)getDiceOutput {
    NSMutableString *diceOutput = [[NSMutableString alloc] init];
    NSString *diceString = [[NSString alloc] init];
    
    for (int i = 0; i < 5; i++) {
        if ([self.diceCollection[i] hold] == 1) {
            diceString = [NSString stringWithFormat:@"[%ld] ", (long)[self.diceCollection[i] currentValue]];
        } else {
            diceString = [NSString stringWithFormat:@"%ld ", (long)[self.diceCollection[i] currentValue]];
        }
        
        [diceOutput appendString:diceString];
    }
    
    return diceOutput;
}

- (NSInteger)getScore {
    NSInteger score = 0;
    NSInteger diceValue = 0;
    
    for (int i = 0; i < 5; i++) {
        if (self.diceCollection[i].hold == 1) {
            diceValue = self.diceCollection[i].currentValue;
            
            if (diceValue == 3) {
                diceValue = 0;
            }
            
            score += diceValue;
        }
    }

    return score;
}

@end
