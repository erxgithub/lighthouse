//
//  main.m
//  Word Effects
//
//  Created by Eric Gregor on 2018-01-15.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 255 unit long array of characters
        char inputChars[255];
        
        while (true) {
            printf("Input a string: ");
            // limit input to max 255 characters
            fgets(inputChars, 255, stdin);
            
            // print as a c string
            printf("Your string is %s\n", inputChars);
            
            // convert char array to an NSString object
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            
            if ([inputString length] <= 1) {
                break;
            }
            
            // print NSString object
            NSLog(@"Input was: %@\n", inputString);

            // uppercase
            inputString = [inputString uppercaseString];
            NSLog(@"Uppercase: %@\n", inputString);

            // lowercase
            inputString = [inputString lowercaseString];
            NSLog(@"Lowercase: %@\n", inputString);

            // numberize
            NSInteger number = [inputString integerValue];
            NSLog(@"Numberize: %ld\n", (long)number);

            // Canadianize
            NSMutableString *newString = [inputString mutableCopy];
            [newString appendString:@", eh"];
            NSLog(@"Canadianize: %@\n", newString);
            
            // respond
            NSLog(@"%@", [inputString substringFromIndex:[inputString length] - 2]);
            if ([[inputString substringFromIndex:[inputString length] - 2] isEqual: @"?\n"]) {
                NSLog(@"I don't know.\n");
            } else if ([[inputString substringFromIndex:[inputString length] - 2] isEqual: @"!\n"]) {
                NSLog(@"Whoa, calm down!\n");
            }

            // de-space-it
            inputString = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
            NSLog(@"De-Space-It: %@\n", inputString);

            // word count
            number = [[inputString componentsSeparatedByString: @"-"] count];
            NSLog(@"Word Count: %ld\n", (long)number);
        }
    }
    return 0;
}
