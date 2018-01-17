//
//  ScoreKeeper.h
//  Maths
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreKeeper : NSObject

@property NSInteger rightCount;
@property NSInteger wrongCount;

- (NSString *)scoreOutput;

@end
