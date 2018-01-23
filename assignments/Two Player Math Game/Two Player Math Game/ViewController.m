//
//  ViewController.m
//  Two Player Math Game
//
//  Created by Eric Gregor on 2018-01-22.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreName1;
@property (weak, nonatomic) IBOutlet UILabel *score1;
@property (weak, nonatomic) IBOutlet UILabel *scoreName2;
@property (weak, nonatomic) IBOutlet UILabel *score2;
@property (weak, nonatomic) IBOutlet UILabel *playerName;
@property (nonatomic) GameModel *gameModel;
@property (nonatomic) Player *player1;
@property (nonatomic) Player *player2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gameModel = [[GameModel alloc] init];
    self.player1 = [[Player alloc] initWithName:@"Player 1" withScore:3];
    self.player2 = [[Player alloc] initWithName:@"Player 2" withScore:3];
    
    self.scoreName1.text = self.player1.name;
    self.scoreName1.text = [self.scoreName1.text stringByAppendingString:@" score:"];
    self.score1.text = [NSString stringWithFormat:@"%ld", (long)self.player1.score];
    
    self.scoreName2.text = self.player2.name;
    self.scoreName2.text = [self.scoreName2.text stringByAppendingString:@" score:"];
    self.score2.text = [NSString stringWithFormat:@"%ld", (long)self.player2.score];

    [self newQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button0:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"0"];
}

- (IBAction)button1:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"1"];
}

- (IBAction)button2:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"2"];
}

- (IBAction)button3:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"3"];
}

- (IBAction)button4:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"4"];
}

- (IBAction)button5:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"5"];
}

- (IBAction)button6:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"6"];
}

- (IBAction)button7:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"7"];
}

- (IBAction)button8:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"8"];
}

- (IBAction)button9:(id)sender {
    if ([self.answerLabel.text  isEqual: @"0"]) {
        [self clearInput];
    }
    
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"9"];
}

- (IBAction)buttonP:(id)sender {
    self.answerLabel.text = [self.answerLabel.text stringByAppendingString:@"."];
}

- (IBAction)buttonC:(id)sender {
    self.answerLabel.text = @"0";
}

- (IBAction)buttonE:(id)sender {
    NSInteger inputNumber = [self.answerLabel.text intValue];
    
    if (inputNumber == self.gameModel.answer) {
        self.resultLabel.text = @"Right!";
    } else {
        self.resultLabel.text = @"Wrong!";
    }
    
    [self.resultLabel sizeToFit];
}

- (void)clearInput {
    self.answerLabel.text = @"";
}

- (void)newQuestion {
    [self.gameModel generateQuestion];
    self.questionLabel.text = self.gameModel.question;
    self.resultLabel.text = @"";
}

@end
