//
//  UserInput.m
//  Threelow
//
//  Created by Eric Gregor on 2018-01-17.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "UserInput.h"

@implementation UserInput

-(NSString *)inputForPrompt:(NSString *)promptString {
    char inputChars[255];
    
    NSLog(@"%@", promptString);
    
    // limit input to max 255 characters
    fgets(inputChars, 255, stdin);
    
    // convert char array to an NSString object
    NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
    
    inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    
    return inputString;
}

@end
