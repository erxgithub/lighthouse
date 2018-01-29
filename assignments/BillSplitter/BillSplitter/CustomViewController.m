//
//  CustomViewController.m
//  BillSplitter
//
//  Created by Eric Gregor on 2018-01-28.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic) NSString *billAmount;
@property (nonatomic) NSString *splitAmount;

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textField.delegate = self;
    self.textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.textField.returnKeyType = UIReturnKeyGo;
    
    [self calculateSplitAmount];
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

- (IBAction)calculatePressed:(id)sender {
    self.billAmount = self.textField.text;
    [self calculateSplitAmount];
}

- (IBAction)sliderValueChanged:(id)sender {
    [self calculateSplitAmount];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    self.billAmount = self.textField.text;
    [self calculateSplitAmount];
    return YES;
}

- (IBAction)textFieldChanged:(id)sender {
    if ([self.billAmount length] > 0) {
        self.billAmount = @"0";
        [self calculateSplitAmount];
    }
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

- (void)calculateSplitAmount {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *splitAmount = [formatter stringFromNumber:[NSNumber numberWithInt:0]];
    
    if (self.textField.text.length > 0) {
        NSDecimalNumber *amount = [[NSDecimalNumber decimalNumberWithString:self.billAmount] decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%d", (int)self.slider.value]]];
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        splitAmount = [formatter stringFromNumber:amount];
    }
    
    self.splitAmount = splitAmount;
    
    [self displayBillSplit];
}

- (void)displayBillSplit {
    NSString *billSplit = [NSString stringWithFormat:@"Bill split amount for %d people is %@", (int)self.slider.value, self.splitAmount];
    
    self.label.text = billSplit;
}

@end
