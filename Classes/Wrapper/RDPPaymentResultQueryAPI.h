//
//  RDPPaymentResultQueryAPI.h
//  ExampleRDP
//
//  Created by 霍驹 on 2018/3/7.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPPaymentResultQueryDelegate.h"

#define RDP_RAPI_PAYMENT_QUERY_DEV_URL @"https://secure-dev.reddotpayment.com/service/Merchant_processor/query_redirection"
#define RDP_RAPI_PAYMENT_QUERY_PRODUCTION_URL @"https://secure.reddotpayment.com/service/Merchant_processor/query_redirection"

@interface RDPPaymentResultQueryAPI : NSObject
@property(nonatomic, strong) NSString* request_mid;
@property(nonatomic, strong) NSString* transaction_id;
@property(nonatomic, strong) NSString* secret_key;
@property(nonatomic, weak) id <RDPPaymentResultQueryDelegate> delegate;
- (id) initWithDelegate:(id<RDPPaymentResultQueryDelegate>) delegate;
- (void) startRequest;

@end
