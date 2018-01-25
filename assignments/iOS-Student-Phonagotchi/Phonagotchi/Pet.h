//
//  Pet.h
//  Phonagotchi
//
//  Created by Eric Gregor on 2018-01-25.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic, readonly) BOOL grumpy;

- (void)checkPettingVelocity:(NSInteger)velocity;

@end
