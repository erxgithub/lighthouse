//
//  Unit.m
//  WarCarftIII
//
//  Created by Aaron Dufall on 5/05/2014.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Unit.h"

@implementation Unit

- (instancetype)init
{
    self = [super init];
    if (self) {
        _healthPoints = 60;
        _attackPower = 10;
    }
    return self;
}

- (instancetype)initWithHP:(int)hp AP:(int)ap
{
    self = [super init];
    if (self) {
        _healthPoints = hp;
        _attackPower = ap;
    }
    return self;
}

- (void)damage:(int)damage {
    self.healthPoints -= damage;
}

//- (void)setHealthPoints:(int)hp {
//    self.healthPoints = hp;
//}

@end
