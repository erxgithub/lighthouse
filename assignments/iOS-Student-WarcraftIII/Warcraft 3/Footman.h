//
//  Footman.h
//  WarCarftIII
//
//  Created by Aaron Dufall on 5/05/2014.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"

@interface Footman : Unit

//@property (assign) int healthPoints;
//@property (assign) int attackPower;

//- (instancetype)initWithHP:(int)hp AP:(int)ap;
- (void)attack:(Unit *)enemy withDamage:(int)damage;

@end
