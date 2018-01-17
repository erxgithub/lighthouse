//
//  QuestionFactory.h
//  Maths
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface QuestionFactory : NSObject

@property (nonatomic) NSArray *questionSubclassNames;

- (Question *)generateRandomQuestion;

@end
