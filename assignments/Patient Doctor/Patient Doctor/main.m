//
//  main.m
//  Patient Doctor
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "Doctor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Patient *patient = [[Patient alloc] initWithName:@"Joe" withAge:35 withHealthCard:@"123456789"];
        Doctor *doctor = [[Doctor alloc] initWithName:@"Dr. Fred" withSpecialization:@"podiatrist"];
        
        NSLog(@"Patient: %@, %ld", patient.name, (long)patient.age);
        NSLog(@"Doctor: %@, %@", doctor.name, doctor.specialization);
        
        NSString *accepted = [doctor acceptPatient:patient];
        NSLog(@"%@", accepted);
        
        NSString *healthCard = [doctor requestMedication:patient.name symptoms:@"none"];
        NSLog(@"%@", healthCard);
    }
    
    return 0;
}
