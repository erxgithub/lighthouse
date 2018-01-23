//
//  NSLayoutConstraint+EvenDistribution.h
//  Autolayout
//
//  Created by Eric Gregor on 2018-01-23.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (EvenDistribution)

/**
 * Returns constraints that will cause a set of views to be evenly distributed horizontally
 * or vertically relative to the center of another item. This is used to maintain an even
 * distribution of subviews even when the superview is resized.
 */
+ (NSArray *) constraintsForEvenDistributionOfItems:(NSArray *)views
                             relativeToCenterOfItem:(id)toView
                                         vertically:(BOOL)vertically;

@end
