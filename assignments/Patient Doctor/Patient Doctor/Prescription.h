//
//  Prescription.h
//  Patient Doctor
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Prescription : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic) NSMutableSet *prescriptions;

@end
