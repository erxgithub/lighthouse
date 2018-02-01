//
//  CustomCollectionViewCell.h
//  InstaKilo
//
//  Created by Eric Gregor on 2018-01-31.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelText;

@end
