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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)colorChange:(id)sender {
    NSArray *colorArray = @[[UIColor blackColor], [UIColor brownColor], [UIColor blueColor], [UIColor greenColor], [UIColor orangeColor], [UIColor redColor], [UIColor yellowColor], [UIColor purpleColor]];
    
    self.colorSelected.backgroundColor = colorArray[(int)self.colorSlider.value];
    
}

@end
