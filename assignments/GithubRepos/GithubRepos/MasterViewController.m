//
//  MasterViewController.m
//  GithubRepos
//
//  Created by Eric Gregor on 2018-02-01.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "MasterViewController.h"
#import "TableViewCell.h"
#import "Repo.h"

@interface MasterViewController ()

@property NSMutableArray<Repo *> *objects;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.objects = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/erxgithub/repos"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            // Handle the error
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        
        // If we reach this point, we have successfully retrieved the JSON from the API
        for (NSDictionary *repo in repos) {
            NSString *repoName = repo[@"name"];
            Repo *repo = [[Repo alloc] initWithName:repoName];
            [self.objects addObject:repo];
            //NSLog(@"repo: %@", repo.repoName);
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // This will run on the main queue
            [self.tableView reloadData];
        }];
        
        
    }];
    
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Repo *object = self.objects[indexPath.row];
    cell.repo = object;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"repoShowDetail"]) {
        DetailViewController *dvc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Repo *repo = self.objects[indexPath.row];
        dvc.repo = repo;
    }
}

@end
