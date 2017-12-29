//
//  Car.m
//  assignment3
//
//  Created by Eric Gregor on 2017-12-28.
//  Copyright © 2017 Eric Gregor. All rights reserved.
//

#import "Car.h"

@implementation Car

-(void) drive {
    NSLog(@"The model of the car you are driving is: %@", _model);
}

- (id)initWithModel:(NSString *) model {
    self = [super init];
    
    if (self) {
        _model = model;
    }
    
    return self;
}

@end
