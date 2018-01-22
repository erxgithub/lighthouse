//
//  ViewController.m
//  PoliceSketch
//
//  Created by Sam Meech-Ward on 2017-10-09.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "LHLViewController.h"
#import "Sketch.h"

@interface LHLViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *eyes;
@property (weak, nonatomic) IBOutlet UIImageView *nose;
@property (weak, nonatomic) IBOutlet UIImageView *mouth;

@property (nonatomic) Sketch *sketch;

@end

@implementation LHLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sketch = [[Sketch alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)eyesLeftButton:(id)sender {
    [self.sketch eyesLeft:self.eyes];
}

- (IBAction)eyesRightButton:(id)sender {
    [self.sketch eyesRight:self.eyes];
}

- (IBAction)noseLeftButton:(id)sender {
    [self.sketch noseLeft:self.nose];
}

- (IBAction)noseRightButton:(id)sender {
    [self.sketch noseRight:self.nose];
}

- (IBAction)mouthLeftButton:(id)sender {
    [self.sketch mouthLeft:self.mouth];
}

- (IBAction)mouthRightButton:(id)sender {
    [self.sketch mouthRight:self.mouth];
}

@end
