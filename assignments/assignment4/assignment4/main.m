//
//  main.m
//  assignment4
//
//  Created by Eric Gregor on 2017-12-28.
//  Copyright © 2017 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

NSNumber* getMaxNumber(NSArray *numbers) {
    return [numbers valueForKeyPath:@"@max.self"];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // assignment 4 - find the largest number in an array
        
        NSArray *numbers;
        NSNumber *maxNumber;
        
        // example 1
        
        numbers = @[@3, @7, @6, @8];
        maxNumber = getMaxNumber(numbers);
        NSLog(@"The largest number in the array is: %@", maxNumber);    // max number: 8
        
        // example 2
        
        numbers = @[@44, @5, @6];
        maxNumber = getMaxNumber(numbers);
        NSLog(@"The largest number in the array is: %@", maxNumber);    // max number: 44
        
        // example 3
        
        numbers = @[@120, @55, @670, @250, @21];
        maxNumber = getMaxNumber(numbers);
        NSLog(@"The largest number in the array is: %@", maxNumber);    // max number = 670
    }
    
    return 0;
}
