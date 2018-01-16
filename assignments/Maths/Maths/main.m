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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ScoreKeeper *score = [[ScoreKeeper alloc] init];
        BOOL gameOn = YES;
        
        while (gameOn) {
            AdditionQuestion *addQuestion = [[AdditionQuestion alloc] init];
            NSLog(@"%@", addQuestion.question);
            
            NSString *inputString = [InputHandler getUserInput];

            if ([inputString isEqual: @"quit"]) {
                break;
            }

            NSInteger inputNumber = [inputString intValue];
            
            if (inputNumber == addQuestion.answer) {
                score.rightCount++;
                NSLog(@"Right!");
            } else {
                score.wrongCount++;
                NSLog(@"Wrong!");
            }
            
            [score printScore];
            
        }
    }
    
    return 0;
}
