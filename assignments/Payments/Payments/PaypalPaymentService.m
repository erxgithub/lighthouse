//
//  PaypalPaymentService.m
//  Payments
//
//  Created by Eric Gregor on 2018-01-19.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "PaypalPaymentService.h"

@implementation PaypalPaymentService

- (void)processPaymentAmount:(NSInteger)dollarValue {
    NSLog(@"Paypal processed amount $%ld", (long)dollarValue);
}

- (BOOL)canProcessPayment {
    int maxNumber = 1;
    int minNumber = 0;
    
    NSInteger canProcess = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;
    
    if (canProcess == 1) {
        return YES;
    } else {
        return NO;
    }
}

@end
