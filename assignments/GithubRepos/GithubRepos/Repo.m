//
//  Repo.m
//  GithubRepos
//
//  Created by Eric Gregor on 2018-02-01.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _repoName = name;
    }
    return self;
}

@end
