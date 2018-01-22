//
//  Sketch.h
//  PoliceSketch
//
//  Created by Eric Gregor on 2018-01-22.
//  Copyright © 2018 Sam Meech-Ward. All rights reserved.
//

@import UIKit;

@interface Sketch : NSObject

@property (nonatomic) NSArray *eyesImages;
@property (nonatomic) NSArray *noseImages;
@property (nonatomic) NSArray *mouthImages;

@property (nonatomic, assign) int eyesImageNo;
@property (nonatomic, assign) int noseImageNo;
@property (nonatomic, assign) int mouthImageNo;

- (void)eyesLeft: (UIImageView *)imageView;
- (void)eyesRight: (UIImageView *)imageView;
- (void)noseLeft: (UIImageView *)imageView;
- (void)noseRight: (UIImageView *)imageView;
- (void)mouthLeft: (UIImageView *)imageView;
- (void)mouthRight: (UIImageView *)imageView;

@end
