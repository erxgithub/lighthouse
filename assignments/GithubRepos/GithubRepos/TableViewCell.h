//
//  TableViewCell.h
//  GithubRepos
//
//  Created by Eric Gregor on 2018-02-01.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repo.h"

@interface TableViewCell : UITableViewCell

@property (nonatomic)Repo *repo;

@end
