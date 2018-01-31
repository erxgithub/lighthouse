//
//  DetailViewController.m
//  EveryDo
//
//  Created by Eric Gregor on 2018-01-30.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo.h"

@interface DetailViewController ()

//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel *taskPriority;
@property (weak, nonatomic) IBOutlet UILabel *taskDescription;


@end

@implementation DetailViewController

//- (void)configureView {
//    // Update the user interface for the detail item.
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
//    }
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
    [self setDetailItem];
}


#pragma mark - Managing the detail item

- (void)setDetailItem {
    if (self.todo.isCompleted) {
        NSDictionary *attributes = @{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle),
                                     NSStrikethroughColorAttributeName: [UIColor blackColor]};
        NSAttributedString *title = [[NSAttributedString alloc] initWithString:self.todo.title attributes:attributes];
        [self.taskTitle setAttributedText:title];
    } else {
        self.taskTitle.text = self.todo.title;
    }
    
    self.taskDescription.text = self.todo.taskDescription;
    self.taskPriority.text = [NSString stringWithFormat:@"%ld", (long)self.todo.priorityLevel];
}


@end
