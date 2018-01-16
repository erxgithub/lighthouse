//
//  Box.h
//  Boxes
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Box : NSObject

@property float height;
@property float width;
@property float length;

- (instancetype)initWithHeight:(float)height width:(float)width length:(float)length;
-(float) calcVolume;
-(float) calcBoxFits:(Box *)differentBox;

@end
