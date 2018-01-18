//
//  Patient.h
//  Patient Doctor
//
//  Created by Eric Gregor on 2018-01-18.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic, strong) NSString *healthCard;

- (instancetype)initWithName: (NSString *)name withAge:(NSInteger)age withHealthCard:(NSString *)healthCard;

@end
