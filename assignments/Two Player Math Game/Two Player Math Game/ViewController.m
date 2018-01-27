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
@property (weak, nonatomic) IBOutlet UIButton *enterButton;
@property (weak, nonatomic) IBOutlet UILabel *gameMessage;

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
    
    self.gameMessage.text = @"";
    
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
    if ([self.enterButton.titleLabel.text isEqual: @"Enter"]) {
        NSInteger inputNumber = [self.answerLabel.text intValue];
        
        if (inputNumber == self.gameModel.answer) {
            self.resultLabel.text = @"Right!";
        } else {
            self.resultLabel.text = @"Wrong!";
            if (self.gameModel.playerNo == 1) {
                [self updatePlayerScore:1 adjustment:-1];
            } else {
                [self updatePlayerScore:2 adjustment:-1];
            }
        }

        [self.resultLabel sizeToFit];
        
        if ([self.score1.text isEqualToString:@"0"] || [self.score2.text isEqualToString:@"0"]) {
            NSString *winnerName = @"";
            
            if ([self.score1.text isEqualToString:@"0"]) {
                winnerName = self.player2.name;
            } else {
                winnerName = self.player1.name;
            }
            
            self.gameMessage.text = [NSString stringWithFormat:@"%@ wins!", winnerName];
            
            [self.enterButton setTitle:@"Restart Game" forState:UIControlStateNormal];
            [self.enterButton setTitle:@"Restart Game" forState:UIControlStateSelected];
            [self.enterButton setTitle:@"Restart Game" forState:UIControlStateHighlighted];
        } else {
            [self.enterButton setTitle:@"New Question" forState:UIControlStateNormal];
            [self.enterButton setTitle:@"New Question" forState:UIControlStateSelected];
            [self.enterButton setTitle:@"New Question" forState:UIControlStateHighlighted];
        }
    } else if ([self.enterButton.titleLabel.text isEqual: @"New Question"]) {
        [self newQuestion];
        
        [self.enterButton setTitle:@"Enter" forState:UIControlStateNormal];
        [self.enterButton setTitle:@"Enter" forState:UIControlStateSelected];
        [self.enterButton setTitle:@"Enter" forState:UIControlStateHighlighted];
    } else if ([self.enterButton.titleLabel.text isEqual: @"Restart Game"]) {
        [self newGame];
        
        [self.enterButton setTitle:@"Enter" forState:UIControlStateNormal];
        [self.enterButton setTitle:@"Enter" forState:UIControlStateSelected];
        [self.enterButton setTitle:@"Enter" forState:UIControlStateHighlighted];
    }
}

- (void)clearInput {
    self.answerLabel.text = @"";
}

- (void)newQuestion {
    [self.gameModel switchPlayer];
    [self updatePlayerName];

    [self.gameModel generateQuestion];
    self.questionLabel.text = self.gameModel.question;
    self.answerLabel.text = @"0";
    self.resultLabel.text = @"";
}

- (void)updatePlayerName {
    if (self.gameModel.playerNo == 1) {
        self.playerName.text = self.player1.name;
    } else {
        self.playerName.text = self.player2.name;
    }
}

- (void)updatePlayerScore:(NSInteger) playerNo adjustment:(NSInteger) value {
    if (self.gameModel.playerNo == 1) {
        [self.player1 adjustScore:value];
        self.score1.text = [NSString stringWithFormat:@"%ld", (long)self.player1.score];
    } else {
        [self.player2 adjustScore:value];
        self.score2.text = [NSString stringWithFormat:@"%ld", (long)self.player2.score];
    }
}

- (void)newGame {
    [self.player1 resetScore:3];
    self.score1.text = [NSString stringWithFormat:@"%ld", (long)self.player1.score];

    [self.player2 resetScore:3];
    self.score2.text = [NSString stringWithFormat:@"%ld", (long)self.player2.score];
    
    self.gameMessage.text = @"";
    
    [self.gameModel switchPlayer];
    [self clearInput];
    [self newQuestion];
}

@end
