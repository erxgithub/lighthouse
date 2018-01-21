//
//  Prescription.m
//  Patient Doctor
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Prescription.h"

@implementation Prescription

- (instancetype)initWithName: (NSString *)name withMedications:(NSString *)medications
{
    self = [super init];
    if (self) {
        _name = name;
        _medications = medications;
    }
    return self;
}

@end
