//
//  main.m
//  Payments
//
//  Created by Eric Gregor on 2018-01-19.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int maxNumber = 1000;
        int minNumber = 100;
        
        NSInteger dollarValue = arc4random_uniform(maxNumber - minNumber + 1) + minNumber;

        NSLog(@"Thank you for shopping at Acme.com");
        NSLog(@"Your total today is $%ld", (long)dollarValue);
        NSLog(@"Please select a payment method");
        NSLog(@"1: Paypal, 2: Stripe, 3: Amazon, 4: Apple");

        char inputChars[255];
        
        // limit input to max 255 characters
        fgets(inputChars, 255, stdin);
        
        // convert char array to an NSString object
        NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
        
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
        
        int paymentMethod = [inputString intValue];
        
        PaymentGateway *paymentGateway = [[PaymentGateway alloc] init];

        switch (paymentMethod) {
            case 2:
                {paymentGateway.paymentDelegate = [[StripePaymentService alloc] init];}
                break;
                
            case 3:
                {paymentGateway.paymentDelegate = [[AmazonPaymentService alloc] init];}
                break;
                
            case 4:
                {paymentGateway.paymentDelegate = [[ApplePaymentService alloc] init];}
                break;
                
            default:
                {paymentGateway.paymentDelegate = [[PaypalPaymentService alloc] init];}
                break;
        }

        [paymentGateway processPaymentAmount:dollarValue];

    }
    return 0;
}
