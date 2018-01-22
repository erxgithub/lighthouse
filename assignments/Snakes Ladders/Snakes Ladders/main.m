//
//  main.m
//  Snakes Ladders
//
//  Created by Eric Gregor on 2018-01-21.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL gameOn = YES;
        
        Player *player = [[Player alloc] init];
        
        NSLog(@"Welcome to Snakes and Ladders!");
        NSLog(@"");
        NSLog(@"Commands:");
        NSLog(@"roll - roll the dice");
        NSLog(@"quit - quit the game");
        NSLog(@"");

        while (gameOn) {
            NSLog(@"Please enter a command >");
            
            NSString *inputString = [InputHandler UserInput];
            
            if ([inputString isEqual: @"quit"] || [inputString isEqual: @"q"]) {
                break;
            }
            
            if ([inputString isEqual: @"roll"] || [inputString isEqual: @"r"]) {
                [player roll];
            }
            
            if (player.gameOver) {
                NSLog(@"Game over!");
                break;
            }
        }
    }
    return 0;
}
