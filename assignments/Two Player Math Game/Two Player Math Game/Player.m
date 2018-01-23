//
//  Player.m
//  Two Player Math Game
//
//  Created by Eric Gregor on 2018-01-22.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (instancetype)initWithName: (NSString *)name withScore: (NSInteger)score
{
    self = [super init];
    if (self) {
        _name = name;
        _score = score;
    }
    return self;
}

@end
