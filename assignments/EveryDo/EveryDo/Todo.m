//
//  Todo.m
//  EveryDo
//
//  Created by Eric Gregor on 2018-01-30.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title taskDescription:(NSString *)taskDescription priorityLevel:(NSInteger)priorityLevel
{
    self = [super init];
    if (self) {
        _title = title;
        _taskDescription = taskDescription;
        _priorityLevel = priorityLevel;
        _isCompleted = NO;
    }
    return self;
}

@end
