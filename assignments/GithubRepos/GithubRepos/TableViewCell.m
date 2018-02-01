//
//  TableViewCell.m
//  GithubRepos
//
//  Created by Eric Gregor on 2018-02-01.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *repoName;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRepo:(Repo *)repo {
    self.repoName.text = repo.repoName;
    
    _repo = repo;
}

@end
