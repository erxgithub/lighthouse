//
//  InputHandler.m
//  Snakes Ladders
//
//  Created by Eric Gregor on 2018-01-21.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (NSString *)UserInput {
    char inputChars[255];
    
    // limit input to max 255 characters
    fgets(inputChars, 255, stdin);
    
    // convert char array to an NSString object
    NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
    
    inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    
    return inputString;
}

@end
