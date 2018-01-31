//
//  TableViewCell.m
//  EveryDo
//
//  Created by Eric Gregor on 2018-01-30.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "TableViewCell.h"
#import "Todo.h"

@interface TableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel *taskDescription;
@property (weak, nonatomic) IBOutlet UILabel *taskPriority;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTodo:(Todo *)todo {
    if (todo.isCompleted) {
        NSDictionary *attributes = @{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle),
                                     NSStrikethroughColorAttributeName: [UIColor blackColor]};
        NSAttributedString *title = [[NSAttributedString alloc] initWithString:todo.title attributes:attributes];
        [self.taskTitle setAttributedText:title];
    } else {
        self.taskTitle.text = todo.title;
    }
    
    self.taskDescription.text = todo.taskDescription;
    self.taskPriority.text = [NSString stringWithFormat:@"%ld", (long)todo.priorityLevel];
    
    _todo = todo;
    
}

@end
