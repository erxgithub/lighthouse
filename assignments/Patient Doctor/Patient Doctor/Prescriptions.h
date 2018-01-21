//
//  Prescriptions.h
//  Patient Doctor
//
//  Created by Eric Gregor on 2018-01-20.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Prescription.h"

@interface Prescriptions : NSObject

@property (nonatomic) NSMutableSet *prescriptions;
@property (nonatomic) NSDictionary *symptoms;

- (NSString *)symptomLookup: (NSString *)symptom;
- (void)addPrescription: (Prescription *)prescription;

@end
