//
//  TableViewCell.h
//  EveryDo
//
//  Created by Eric Gregor on 2018-01-30.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Todo;

@interface TableViewCell : UITableViewCell

@property (nonatomic)Todo *todo;

@end
