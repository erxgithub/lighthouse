//
//  Footman.m
//  WarCarftIII
//
//  Created by Aaron Dufall on 5/05/2014.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Footman.h"

@implementation Footman

//-(instancetype)init{
//    super.healthPoints = 60;
//    super.attackPower = 10;
//    return self;
//}

//- (instancetype)initWithHP:(int)hp AP:(int)ap
//{
//    self = [super init];
//    if (self) {
//        healthPoints = hp;
//        attackPower = ap;
//    }
//    return self;
//}

- (void)attack:(Unit *)enemy withDamage:(int)damage {
    [enemy damage:damage];
}

@end
