//
//  GameModel.h
//  Two Player Math Game
//
//  Created by Eric Gregor on 2018-01-22.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject

@property (nonatomic, strong) NSString *question;
@property (nonatomic) NSInteger answer;
@property (nonatomic) NSInteger leftValue;
@property (nonatomic) NSInteger rightValue;
@property (nonatomic) NSInteger playerNo;

- (void)generateQuestion;
- (void)switchPlayer;

@end
