//
//  main.m
//  assignment3
//
//  Created by Eric Gregor on 2017-12-28.
//  Copyright © 2017 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Toyota.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // assignment 3 - Toyotas are cars too!
        
        Car *nissan = [[Car alloc] initWithModel:@"Rogue"];
        [nissan drive];

        Toyota *toyota = [[Toyota alloc] init];
        [toyota drive];
    }
    
    return 0;
}
