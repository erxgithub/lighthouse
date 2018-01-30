//
//  CustomViewController.m
//  ScrollViewImageGalleries
//
//  Created by Eric Gregor on 2018-01-29.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.scrollView.translatesAutoresizingMaskIntoConstraints = YES;
    self.scrollView.pagingEnabled = YES;
    NSLog(@"%@", self.scrollView.leftAnchor);
    NSLog(@"%@", self.scrollView.leadingAnchor);

    // page control
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 424, self.scrollView.frame.size.width, 36)];
    pageControl.backgroundColor=[UIColor blackColor];
    pageControl.numberOfPages=3;
    pageControl.alpha = 0.5;
    //[pageControl addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
    
    UIImage *image1 = [UIImage imageNamed:@"Lighthouse"];
    UIImage *image2 = [UIImage imageNamed:@"Lighthouse-in-Field"];
    UIImage *image3 = [UIImage imageNamed:@"Lighthouse-night"];

    NSArray *images = @[image1, image2, image3];
    
    for (int i = 0; i < [images count]; i++) {
        CGFloat xOrigin = i * self.scrollView.frame.size.width;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin,0,self.scrollView.frame.size.width,self.scrollView.frame.size.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [imageView setImage:[images objectAtIndex:i]];
        [self.scrollView addSubview:imageView];
    }

    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, 768);
    [self.view addSubview:pageControl];
    
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event  {
    NSLog(@"touches recieved");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
