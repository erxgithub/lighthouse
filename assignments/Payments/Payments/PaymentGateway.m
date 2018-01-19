//
//  PaymentGateway.m
//  Payments
//
//  Created by Eric Gregor on 2018-01-19.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "PaymentGateway.h"

@implementation PaymentGateway

- (void)processPaymentAmount: (NSInteger)dollarValue {
    NSLog(@"PaymentGateway");
    if ([self.paymentDelegate canProcessPayment]) {
        [self.paymentDelegate processPaymentAmount:dollarValue];
    } else {
        NSLog(@"Sorry, payment cannot be processed.");
    }
}

@end
