//
//  ViewController.m
//  FingerPaint
//
//  Created by Eric Gregor on 2018-01-26.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *colorSelected;
@property (weak, nonatomic) IBOutlet UISlider *colorSlider;
@property (weak, nonatomic) IBOutlet CustomView *customView;

@property (nonatomic) NSArray *colorArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.colorArray = @[[UIColor blackColor], [UIColor darkGrayColor], [UIColor lightGrayColor], [UIColor brownColor], [UIColor blueColor], [UIColor cyanColor], [UIColor greenColor], [UIColor redColor], [UIColor purpleColor], [UIColor magentaColor], [UIColor orangeColor], [UIColor yellowColor]];
    
    self.colorSelected.backgroundColor = self.colorArray[(int)self.colorSlider.value];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)colorChange:(id)sender {
    self.colorSelected.backgroundColor = self.colorArray[(int)self.colorSlider.value];
    self.customView.color = self.colorSelected.backgroundColor;
}

- (IBAction)clearView:(id)sender {
    [self.customView clear];
}

@end
