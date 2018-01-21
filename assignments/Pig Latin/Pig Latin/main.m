//
//  main.m
//  Pig Latin
//
//  Created by Eric Gregor on 2018-01-21.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *sentence = @"this sentence is converted to pig latin";
        
        NSLog(@"%@", sentence);
        NSLog(@"%@", [sentence stringByPigLatinization]);
    }
    
    return 0;
}
