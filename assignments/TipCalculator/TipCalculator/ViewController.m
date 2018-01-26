//
//  ViewController.m
//  TipCalculator
//
//  Created by Eric Gregor on 2018-01-26.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.billAmountTextField.delegate = self;
    self.tipPercentageTextField.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateTipButton:(id)sender {
    [self calculateTip];
}

- (void)calculateTip {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *tipString = [formatter stringFromNumber:[NSNumber numberWithInt:0]];

    if (self.billAmountTextField.text.length > 0 && self.tipPercentageTextField.text.length > 0) {
        NSDecimalNumber *amount = [NSDecimalNumber decimalNumberWithString:self.billAmountTextField.text];
        NSDecimalNumber *percentage = [[NSDecimalNumber decimalNumberWithString:self.tipPercentageTextField.text] decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"100"]];
        
        if ([amount doubleValue] > 0 && [percentage doubleValue] > 0) {
            NSDecimalNumber *tip = [amount decimalNumberByMultiplyingBy:percentage];
            
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
            tipString = [formatter stringFromNumber:tip];
        }
    }
    
    self.tipAmountLabel.text = tipString;
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    static NSString *numbers = @"0123456789";
    static NSString *numbersPeriod = @"01234567890.";
    static NSString *numbersComma = @"0123456789,";
    
    //NSLog(@"%d %d %@", range.location, range.length, string);
    if (range.length > 0 && [string length] == 0) {
        // enable delete
        return YES;
    }

    NSString *symbol = [[NSLocale currentLocale] objectForKey:NSLocaleDecimalSeparator];
    if (range.location == 0 && [string isEqualToString:symbol]) {
        // decimalseparator should not be first
        return NO;
    }
    NSCharacterSet *characterSet;
    NSRange separatorRange = [textField.text rangeOfString:symbol];
    if (separatorRange.location == NSNotFound) {
        if ([symbol isEqualToString:@"."]) {
            characterSet = [[NSCharacterSet characterSetWithCharactersInString:numbersPeriod] invertedSet];
        }
        else {
            characterSet = [[NSCharacterSet characterSetWithCharactersInString:numbersComma] invertedSet];
        }
    }
    else {
        // tag value used to indicate the number of allowed decimal places
        NSInteger decPlaces = textField.tag;
        
        if (range.location > (separatorRange.location + decPlaces)) {
            return NO;
        }
        characterSet = [[NSCharacterSet characterSetWithCharactersInString:numbers] invertedSet];
    }
    return ([[string stringByTrimmingCharactersInSet:characterSet] length] > 0);
}

@end
