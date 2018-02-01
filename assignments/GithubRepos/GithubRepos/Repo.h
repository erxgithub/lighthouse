//
//  Repo.h
//  GithubRepos
//
//  Created by Eric Gregor on 2018-02-01.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Repo : NSObject

@property (nonatomic, strong) NSString *repoName;

- (instancetype)initWithName:(NSString *)name;

@end
