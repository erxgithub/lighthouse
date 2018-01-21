//
//  NSString+PigLatin.m
//  Pig Latin
//
//  Created by Eric Gregor on 2018-01-21.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization {
    NSArray *words = [self componentsSeparatedByString:@" "];
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUYaeiouy"];
    NSMutableString *sentence = [[NSMutableString alloc] init];

    for (NSString *word in words) {
        //NSLog(@"word: %@", word);
        
        NSMutableArray *consonants = [[word componentsSeparatedByCharactersInSet:vowels] mutableCopy];
        //NSLog(@"%@", consonants);
        NSString *firstConsonants = [consonants objectAtIndex:0];
        //NSLog(@"firstConsonants: %@", firstConsonants);
        NSString *afterConsonants = [word substringFromIndex:[firstConsonants length]];
        //NSLog(@"afterConsonants: %@", afterConsonants);        
        NSMutableString *pigLatinWord = [[NSMutableString alloc] init];
        [pigLatinWord appendString:afterConsonants];
        [pigLatinWord appendString:firstConsonants];
        [pigLatinWord appendString:@"ay"];
        //NSLog(@"pigLatinWord: %@", pigLatinWord);

        if ([sentence length] > 0) {
            [sentence appendString:@" "];
        }
        [sentence appendString:pigLatinWord];
    }
    
    return sentence;
}

@end
