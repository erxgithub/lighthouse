//
//  Todo.h
//  EveryDo
//
//  Created by Eric Gregor on 2018-01-30.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *taskDescription;
@property (nonatomic, assign) NSInteger priorityLevel;
@property (nonatomic, assign) BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)title taskDescription:(NSString *)taskDescription priorityLevel:(NSInteger)priorityLevel;

@end
