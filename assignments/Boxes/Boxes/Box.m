//
//  Box.m
//  Boxes
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Box.h"

@implementation Box

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithHeight:(float)height width:(float)width length:(float)length {
    self = [super init];
    if (self) {
        self.height = height;
        self.width = width;
        self.length = length;
    }
    return self;
}

-(float)calcVolume {
    return self.height * self.width * self.length;
}

-(float) calcBoxFits:(Box *)differentBox {
    float volume1 = self.calcVolume;
    float volume2 = [differentBox calcVolume];
    
    return volume1 / volume2;
}

@end
