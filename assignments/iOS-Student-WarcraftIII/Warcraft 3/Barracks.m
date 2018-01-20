//
//  Barracks.m
//  
//
//  Created by Daniel Mathews on 2015-07-31.
//
//

#import "Barracks.h"

@implementation Barracks

- (instancetype)init
{
    self = [super init];
    if (self) {
        _gold = 1000;
        _food = 80;
    }
    return self;
}

- (Footman *)trainFootman {
    if (self.canTrainFootman) {
        self.gold -= 135;
        self.food -= 2;
        return [[Footman alloc] init];
    } else {
        return nil;
    }
}

- (BOOL)canTrainFootman {
    if (self.food < 2 || self.gold < 135) {
        return NO;
    } else {
        return YES;
    }
}

- (Peasant *)trainPeasant {
    if (self.canTrainFootman) {
        self.gold -= 90;
        self.food -= 5;
        return [[Peasant alloc] init];
    } else {
        return nil;
    }
}

- (BOOL)canTrainPeasant {
    if (self.food < 5 || self.gold < 90) {
        return NO;
    } else {
        return YES;
    }
}

@end
