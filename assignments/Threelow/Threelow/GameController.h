//
//  GameController.h
//  Threelow
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property (nonatomic) NSMutableArray<Dice *> *diceCollection;

- (void)rollDice: (int) mode;
- (NSString *)getDiceOutput;
- (void)holdDice: (int) number;
- (void)resetDice;
- (NSInteger)getScore;

@end
