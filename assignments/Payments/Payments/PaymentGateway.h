//
//  PaymentGateway.h
//  Payments
//
//  Created by Eric Gregor on 2018-01-19.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentDelegate <NSObject>

@required

- (void)processPaymentAmount: (NSInteger)dollarValue;
- (BOOL)canProcessPayment;

@end

@interface PaymentGateway : NSObject

@property (nonatomic) id<PaymentDelegate> paymentDelegate;

- (void)processPaymentAmount: (NSInteger)dollarValue;

@end
