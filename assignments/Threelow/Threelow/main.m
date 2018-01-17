//
//  main.m
//  Threelow
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInput.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        UserInput *userInput = [[UserInput alloc] init];
        GameController *gameController = [[GameController alloc] init];
        NSString *inputString = @"";
        BOOL gameOn = YES;

        NSLog(@"Threelow");
        NSLog(@"");
        NSLog(@"roll - roll the dice");
        NSLog(@"hold - hold/unhold dice");
        NSLog(@"reset - reset all dice holds");
        NSLog(@"quit - quit the game");
        NSLog(@"");
        
        while (gameOn) {
            if ([inputString isEqual: @"roll"]) {
                inputString = @"hold";
            } else {
                inputString = [userInput inputForPrompt:@"What would you like do next?"];
            }
            
            if ([inputString isEqual: @"quit"]) {
                break;
            } else if ([inputString isEqual: @"roll"]) {
                [gameController rollDice:0];
            } else if ([inputString isEqual: @"rolll"]) {
                [gameController rollDice:1];
            } else if ([inputString isEqual: @"hold"]) {
                NSString *number = [userInput inputForPrompt:@"Enter dice number to hold/unhold: "];
                [gameController holdDice:[number intValue]];
            } else if ([inputString isEqual: @"reset"]) {
                [gameController resetDice];
            }
            
            NSLog(@"%@", [gameController getDiceOutput]);
            NSLog(@"score: %ld", (long)[gameController getScore]);
            NSLog(@"");
        }
    }
    
    return 0;
}
