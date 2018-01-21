//
//  Prescriptions.m
//  Patient Doctor
//
//  Created by Eric Gregor on 2018-01-20.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Prescriptions.h"

@implementation Prescriptions

- (instancetype)init
{
    self = [super init];
    if (self) {
        _prescriptions = [[NSMutableSet alloc] init];
        
        _symptoms = [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"cough syrop", @"cough",
                     @"aspirin", @"headache",
                     @"cold medicine", @"sneezing",
                     @"ointment", @"rash",
                     @"lozenges", @"sore throat",
                     nil];
    }
    return self;
}

- (NSString *)symptomLookup: (NSString *)symptom {
    return [self.symptoms objectForKey:symptom];
}

- (void)addPrescription: (Prescription *)prescription {
    [self.prescriptions addObject:prescription];
}

@end
