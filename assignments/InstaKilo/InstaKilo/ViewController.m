//
//  ViewController.m
//  InstaKilo
//
//  Created by Eric Gregor on 2018-01-31.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"
#import "HeaderView.h"

@interface ViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *defaultLayout;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic, strong) NSArray *subjectImages;
@property (nonatomic, strong) NSArray *subjectLabels;

@property (nonatomic, strong) NSArray *locationImages;
@property (nonatomic, strong) NSArray *locationLabels;

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *labels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Olive
    NSString *image1 = @"image1";
    NSString *image2 = @"image2";
    NSString *image7 = @"image7";
    NSString *image8 = @"image8";
    NSString *image9 = @"image9";
    NSString *image10 = @"image10";
    NSString *image11 = @"image11";

    // Sherman
    NSString *image3 = @"image3";
    NSString *image4 = @"image4";
    NSString *image5 = @"image5";
    NSString *image6 = @"image6";
    NSString *image12 = @"image12";
    
    NSArray *oliveImages = @[image1, image2, image7, image8, image9, image10, image11];
    NSArray *shermanImages = @[image3, image4, image5, image6, image12];

    NSArray *scarboroughImages = @[image1, image2, image7];
    NSArray *beachesImages = @[image8, image9, image10, image11];
    NSArray *torontoImages = @[image3, image4, image5, image6, image12];
    
    self.subjectImages = @[oliveImages, shermanImages];
    self.subjectLabels = @[@"Olive", @"Sherman"];
    
    self.locationImages = @[scarboroughImages, beachesImages, torontoImages];
    self.locationLabels = @[@"Scarborough", @"Beaches", @"Toronto"];

    self.images = self.subjectImages;
    self.labels = self.subjectLabels;

    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //return 1;
    return [self.images count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return section + 12;
    return [[self.images objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    //UILabel *label = [cell viewWithTag:1];
    //label.text = [NSString stringWithFormat:@"%ld, %ld", indexPath.section, indexPath.item];
    cell.labelText.text = [NSString stringWithFormat:@"%ld", indexPath.item];

    //UIImageView *imageView = [cell viewWithTag:2];
    //imageView.image = [UIImage imageNamed:[self.images[indexPath.section] objectAtIndex:indexPath.item]];
    cell.imageView.image = [UIImage imageNamed:[self.images[indexPath.section] objectAtIndex:indexPath.item]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderSection" forIndexPath:indexPath];
        //header.headerLabel.text = [NSString stringWithFormat:@"Section %ld", indexPath.section];
        header.headerLabel.text = self.labels[indexPath.section];
        [header.headerLabel sizeToFit];

        return header;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FooterSection" forIndexPath:indexPath];
        
        return footer;
    }
    
    return nil;
}

- (IBAction)changeCollectionGrouping:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 1) {
        self.images = self.locationImages;
        self.labels = self.locationLabels;
    } else {
        self.images = self.subjectImages;
        self.labels = self.subjectLabels;
    }
    
    [self.collectionView reloadData];
}

@end
