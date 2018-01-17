//
//  main.m
//  Maths
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdditionQuestion.h"
#import "InputHandler.h"
#import "ScoreKeeper.h"
#import "QuestionManager.h"
#import "QuestionFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ScoreKeeper *scoreKeeper = [[ScoreKeeper alloc] init];
        QuestionManager *questionManager = [[QuestionManager alloc] init];
        QuestionFactory *questionFactory = [[QuestionFactory alloc] init];
        BOOL gameOn = YES;
        
        while (gameOn) {
            Question *question = [questionFactory generateRandomQuestion];
            [questionManager.questions addObject:question];
            NSLog(@"%@", question.question);
            
            NSString *inputString = [InputHandler getUserInput];

            if ([inputString isEqual: @"quit"]) {
                break;
            }

            NSInteger inputNumber = [inputString intValue];
            
            if (inputNumber == question.answer) {
                scoreKeeper.rightCount++;
                NSLog(@"Right!");
            } else {
                scoreKeeper.wrongCount++;
                NSLog(@"Wrong!");
            }
            
            questionManager.totalTime += [question answerTime];

            NSLog(@"%@", [scoreKeeper scoreOutput]);
            NSLog(@"%@", [questionManager timeOutput]);
        }
    }
    
    return 0;
}
