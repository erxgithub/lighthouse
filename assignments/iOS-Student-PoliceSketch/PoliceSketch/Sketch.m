//
//  Sketch.m
//  PoliceSketch
//
//  Created by Eric Gregor on 2018-01-22.
//  Copyright © 2018 Sam Meech-Ward. All rights reserved.
//

#import "Sketch.h"

@implementation Sketch

- (instancetype)init
{
    self = [super init];
    if (self) {
        _eyesImages = @[
                        [UIImage imageNamed: @"eyes_1.jpg"],
                        [UIImage imageNamed: @"eyes_2.jpg"],
                        [UIImage imageNamed: @"eyes_3.jpg"],
                        [UIImage imageNamed: @"eyes_4.jpg"],
                        [UIImage imageNamed: @"eyes_5.jpg"]
                        ];

        _noseImages = @[
                        [UIImage imageNamed: @"nose_1.jpg"],
                        [UIImage imageNamed: @"nose_2.jpg"],
                        [UIImage imageNamed: @"nose_3.jpg"],
                        [UIImage imageNamed: @"nose_4.jpg"],
                        [UIImage imageNamed: @"nose_5.jpg"]
                        ];
        
        _mouthImages = @[
                        [UIImage imageNamed: @"mouth_1.jpg"],
                        [UIImage imageNamed: @"mouth_2.jpg"],
                        [UIImage imageNamed: @"mouth_3.jpg"],
                        [UIImage imageNamed: @"mouth_4.jpg"],
                        [UIImage imageNamed: @"mouth_5.jpg"]
                        ];
        
        _eyesImageNo = 0;
        _noseImageNo = 0;
        _mouthImageNo = 0;
    }
    return self;
}

- (void)eyesLeft: (UIImageView *)imageView {
    self.eyesImageNo--;
    if (self.eyesImageNo < 0) {
        self.eyesImageNo = (int)[self.eyesImages count] - 1;
    }

    imageView.image = self.eyesImages[self.eyesImageNo];
}

- (void)eyesRight: (UIImageView *)imageView {
    self.eyesImageNo++;
    if (self.eyesImageNo >= [self.eyesImages count]) {
        self.eyesImageNo = 0;
    }

    imageView.image = self.eyesImages[self.eyesImageNo];
}

- (void)noseLeft: (UIImageView *)imageView {
    self.noseImageNo--;
    if (self.noseImageNo < 0) {
        self.noseImageNo = (int)[self.noseImages count] - 1;
    }
    
    imageView.image = self.noseImages[self.noseImageNo];
}

- (void)noseRight: (UIImageView *)imageView {
    self.noseImageNo++;
    if (self.noseImageNo >= [self.noseImages count]) {
        self.noseImageNo = 0;
    }
    
    imageView.image = self.noseImages[self.noseImageNo];
}

- (void)mouthLeft: (UIImageView *)imageView {
    self.mouthImageNo--;
    if (self.mouthImageNo < 0) {
        self.mouthImageNo = (int)[self.mouthImages count] - 1;
    }
    
    imageView.image = self.mouthImages[self.mouthImageNo];
}

- (void)mouthRight: (UIImageView *)imageView {
    self.mouthImageNo++;
    if (self.mouthImageNo >= [self.mouthImages count]) {
        self.mouthImageNo = 0;
    }
    
    imageView.image = self.mouthImages[self.mouthImageNo];
}

@end
