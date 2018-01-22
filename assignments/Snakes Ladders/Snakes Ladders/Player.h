//
//  Player.h
//  Snakes Ladders
//
//  Created by Eric Gregor on 2018-01-21.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSInteger currentSquare;
@property (nonatomic) NSDictionary *gameLogic;
@property (nonatomic, assign) BOOL gameOver;

- (void) roll;

@end
