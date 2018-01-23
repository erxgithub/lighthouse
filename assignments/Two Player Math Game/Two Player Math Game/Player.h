//
//  Player.h
//  Two Player Math Game
//
//  Created by Eric Gregor on 2018-01-22.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger score;

- (instancetype)initWithName: (NSString *)name withScore: (NSInteger)score;

@end
