//
//  Car.h
//  assignment3
//
//  Created by Eric Gregor on 2017-12-28.
//  Copyright © 2017 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property NSString *model;

-(void) drive;

- (id)initWithModel:(NSString *) model;

@end
