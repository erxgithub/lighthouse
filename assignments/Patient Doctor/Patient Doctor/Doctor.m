//
//  Doctor.m
//  Patient Doctor
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithName: (NSString *)name withSpecialization: (NSString *)specialization
{
    self = [super init];
    if (self) {
        _name = name;
        _specialization = specialization;
        
        _acceptedPatients = [[NSMutableSet alloc] init];
    }
    return self;
}

- (NSString *)acceptPatient: (Patient *)patient {
    if ([patient.healthCard length] > 0) {
        [self.acceptedPatients addObject:patient];
        return @"patient accepted";
    } else {
        return @"healthcard not valid";
    }
}

- (NSString *)requestMedication: (NSString *)name symptoms:(NSString *)symptoms {
    Patient *patient = [self.acceptedPatients valueForKey:name];
    return patient.healthCard;
}

@end
