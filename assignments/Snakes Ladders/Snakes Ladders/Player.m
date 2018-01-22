//
//  Player.m
//  Snakes Ladders
//
//  Created by Eric Gregor on 2018-01-21.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        _gameLogic = [[NSDictionary alloc] init];
        _gameOver = NO;
        
        _gameLogic = @{
                       @4 : @14,    // ladder
                       @9 : @31,    // ladder
                       @17 : @7,    // snake
                       @20 : @38,   // ladder
                       @28 : @84,   // ladder
                       @40 : @59,   // ladder
                       @51 : @67,   // ladder
                       @63 : @81,   // ladder
                       @64 : @60,   // snake
                       @89 : @26,   // snake
                       @95 : @75,   // snake
                       @99 : @78    // snake
                       };
    }
    return self;
}

- (void) roll {
    int maxNumber = 6;
    int minNumber = 1;
    
    int diceValue = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;
    NSLog(@"You rolled a %d", diceValue);
    
    NSInteger newSquare = self.currentSquare + diceValue;
    NSLog(@"You landed on %ld", (long)newSquare);

    NSNumber *lookupSquare = [self.gameLogic objectForKey:[NSNumber numberWithInteger:newSquare]];
    
    if (lookupSquare != nil) {
        if ([lookupSquare integerValue] > newSquare) {
            NSLog(@"Ladder!");
        } else {
            NSLog(@"Snake!");
        }
        
        NSLog(@"You jumped from %ld to %ld", (long)newSquare, (long)[lookupSquare integerValue]);
        newSquare = [lookupSquare integerValue];
    }

    self.currentSquare = newSquare;
    
    if (newSquare >= 100) {
        self.gameOver = YES;
    }
}

@end
