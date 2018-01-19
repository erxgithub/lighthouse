//
//  Doctor.h
//  Patient Doctor
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Doctor : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *specialization;
@property (nonatomic, strong) NSMutableSet *acceptedPatients;

- (NSString *)acceptPatient: (Patient *)patient;
- (NSString *)requestMedication: (NSString *)name symptoms:(NSString *)symptoms;

- (instancetype)initWithName: (NSString *)name withSpecialization: (NSString *)specialization;

@end
