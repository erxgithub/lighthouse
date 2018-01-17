//
//  QuestionManager.h
//  Maths
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionManager : NSObject

@property (nonatomic) NSMutableArray *questions;
@property (nonatomic) NSTimeInterval totalTime;

- (NSString *)timeOutput;

@end
