//
//  Patient.m
//  Patient Doctor
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithName: (NSString *)name withAge:(NSInteger)age withHealthCard:(NSString *)healthCard
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _healthCard = healthCard;
    }
    return self;
}

@end
