//
//  AddViewController.m
//  EveryDo
//
//  Created by Eric Gregor on 2018-01-30.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *taskTitleField;
@property (weak, nonatomic) IBOutlet UITextField *taskPriorityField;
@property (weak, nonatomic) IBOutlet UITextView *taskDescriptionField;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"save"]) {
        return self.taskTitle != nil && ![self.taskTitle isEqualToString:@""];
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    [self performSegueWithIdentifier:@"save" sender:self];
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.taskTitleField) {
        self.taskTitle = self.taskTitleField.text;
    } else if (textField == self.taskPriorityField) {
        self.taskPriority = [self.taskPriorityField.text integerValue];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView == self.taskDescriptionField) {
        self.taskDescription = [[self.taskDescriptionField textStorage] string];
    }
}

@end
