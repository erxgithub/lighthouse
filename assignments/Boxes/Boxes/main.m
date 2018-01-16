//
//  main.m
//  Boxes
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Box *box1 = [[Box alloc] initWithHeight:10 width:15 length:20];
        float volume1 = [box1 calcVolume];
        NSLog(@"Box 1 Volume: %f", volume1);
        
        Box *box2 = [[Box alloc] initWithHeight:5 width:10 length:15];
        float volume2 = [box2 calcVolume];
        NSLog(@"Box 2 Volume: %f", volume2);

        float boxFits = 0;
        
        if (volume1 > volume2) {
            boxFits = [box1 calcBoxFits:box2];
            NSLog(@"Box 2 fits into box 1 %f times.", boxFits);
        } else {
            boxFits = [box2 calcBoxFits:box1];
            NSLog(@"Box 1 fits into box 2 %f times.", boxFits);
        }
        
    }
    
    return 0;
}
