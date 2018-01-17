//
//  InputCollector.m
//  Contact List
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString {
    char inputChars[255];
    
    printf("%s", [promptString UTF8String]);
    
    // limit input to max 255 characters
    fgets(inputChars, 255, stdin);
    
    // convert char array to an NSString object
    NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
    
    inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    
    return inputString;
}

@end
