//
//  AddViewController.h
//  EveryDo
//
//  Created by Eric Gregor on 2018-01-30.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController

@property (nonatomic, strong) NSString *taskTitle;
@property (nonatomic, assign) NSInteger taskPriority;
@property (nonatomic, strong) NSString *taskDescription;

@end
